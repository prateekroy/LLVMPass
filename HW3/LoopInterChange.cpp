#include "llvm/Pass.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/PostOrderIterator.h"
#include "llvm/ADT/SCCIterator.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Operator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include <string>
#include <vector>
#include <set>
#include <map>
#include <stack>
using namespace std;
using namespace llvm;
#include "./LoopInterChange.h"

bool changeIR(int);
vector<int> to_vec(set<int>& myset){
	vector<int> myvec;
	for(auto s: myset)
		myvec.push_back(s);
	
	return myvec;
}

        void printBB(BasicBlock* bb){
                errs() << "\n*********BB**********\n";
                for(auto &I: *bb){
                        errs() << I << "\n";
                }
                errs() << "\n*********BB**********\n";
        }

        void printBBOp(BasicBlock* bb){
                errs() << "\n----------BB OP------------\n";
                for(auto &I : *bb)
                        {
                                int numofop = I.getNumOperands();
                                for(int i = 0; i < numofop; ++i)
                                {
                                        Value *Val = I.getOperand(i);
                                        if (isa<Constant>(Val))continue;
                                        Instruction *opI = dyn_cast<Instruction>(Val);
                                        if (!opI)continue;
                                        errs() << *opI << "\n";
                                }

                        }
                errs() << "\n----------BB OP------------\n";
        }


BasicBlock* getLoopPreheader(BasicBlock* bb){
	BasicBlock* ret;
	for(auto b : predecessors(bb)){
		ret = b;
	}
	return ret;
}

BasicBlock* getLoopSuccessor(BasicBlock* bb){
        BasicBlock* ret;
        for(auto b : successors(bb)){
                ret = b;
        }
        return ret;
}

void getLoopParameters(map<int, BasicBlock*>& blockMap, set<string>& blocks, map<int, set<int>>& loopMap, int innerLoopIndex, int outerLoopIndex,
			BasicBlock* OuterLoopPreHeader, BasicBlock* OuterLoopHeader, BasicBlock* OuterLoopLatch, 
				BasicBlock* InnerLoopPreHeader, BasicBlock* InnerLoopHeader, BasicBlock* InnerLoopLatch)
{
        vector<int> OuterLoopBlocks = to_vec(loopMap[outerLoopIndex]);
        vector<int> InnerLoopBlocks = to_vec(loopMap[innerLoopIndex]);

        //Debug
        errs() << "Outer Loop : ";
        for(auto& b : OuterLoopBlocks)
                errs() << b << " ";

        errs() << "Inner Loop : ";
        for(auto& b : InnerLoopBlocks)
                errs() << b << " ";
        errs() << "\n";

        OuterLoopPreHeader = getLoopPreheader(blockMap[OuterLoopBlocks[0]]);
        OuterLoopHeader = blockMap[OuterLoopBlocks[0]];
        OuterLoopLatch = blockMap[OuterLoopBlocks.size()-1];

        InnerLoopPreHeader = getLoopPreheader(blockMap[InnerLoopBlocks[0]]);
        InnerLoopHeader = blockMap[InnerLoopBlocks[0]];
        InnerLoopLatch = blockMap[InnerLoopBlocks.size()-1];

        //printBB(OuterLoopPreHeader);
        //printBB(OuterLoopHeader);
       // printBB(InnerLoopPreHeader);
        //printBB(InnerLoopHeader);
}

bool SpecialCondition(BasicBlock* InnerLoopPreHeader, BasicBlock* OuterLoopBBS){
	
	if(InnerLoopPreHeader->size() != 2 || OuterLoopBBS->size() != 1)return false;  
	
	return true;
}

bool perfectlyNested(BasicBlock* OuterLoopPreHeader, BasicBlock* OuterLoopHeader, BasicBlock* OuterLoopBBS, BasicBlock* OuterLoopLatch,
                                BasicBlock* InnerLoopPreHeader, BasicBlock* InnerLoopHeader, BasicBlock* InnerLoopLatch)
{
        BranchInst *OuterLoopHeaderBI = dyn_cast<BranchInst>(OuterLoopHeader->getTerminator());
	BranchInst *OuterLoopBBSBI = dyn_cast<BranchInst>(OuterLoopBBS->getTerminator());
        if (!OuterLoopHeaderBI || !OuterLoopBBS)
        {
        	return false;
        }
	//errs() << *OuterLoopHeaderBI << "\n";
        if((OuterLoopHeaderBI->getSuccessor(0) == InnerLoopPreHeader) && (OuterLoopBBSBI->getSuccessor(0) == OuterLoopLatch) 
				&& SpecialCondition(InnerLoopPreHeader, OuterLoopBBS)){
		return true;
	}

	return false;

}

bool areLoopDependent(BasicBlock* OuterLoopPreHeader, BasicBlock* OuterLoopHeader, BasicBlock* OuterLoopLatch,
                                BasicBlock* InnerLoopPreHeader, BasicBlock* InnerLoopHeader, BasicBlock* InnerLoopLatch){

	Value* IndexOuterLoop = NULL;
	
	Instruction* it = &*(++OuterLoopPreHeader->rbegin());
	//errs() << "Outer Loop last but one : " << *it << "\n";
	
	if(dyn_cast<StoreInst>(it)){
		IndexOuterLoop = it->getOperand(1);
	}

	return (IndexOuterLoop->isUsedInBasicBlock(InnerLoopPreHeader)||IndexOuterLoop->isUsedInBasicBlock(InnerLoopHeader)||IndexOuterLoop->isUsedInBasicBlock(InnerLoopLatch)); 

}

Value* getLastButOneInst(BasicBlock* OuterLoopPreHeader, int opindex){
        Value* IndexOuterLoop = NULL;

        Instruction* it = &*(++OuterLoopPreHeader->rbegin());
        //errs() << "Outer Loop last but one : " << *it << "\n";

        if(dyn_cast<StoreInst>(it)){
                IndexOuterLoop = it->getOperand(opindex);
        }

	return IndexOuterLoop;
}

Value* getLoopIndexVar(BasicBlock* OuterLoopPreHeader){
	return getLastButOneInst(OuterLoopPreHeader, 1);
}

Value* getLoopIndexVal(BasicBlock* OuterLoopPreHeader){
	return getLastButOneInst(OuterLoopPreHeader, 0);
}

User* getLastUser(Value* val)
{
                                User* lastUser;
                                for(auto U : val->users()){
                                        for(int i = 0; i < U->getNumOperands(); ++i)
                                        {
                                                //errs() << " op : "<< *(U->getOperand(i)) << "\n";
                                        }
                                        //errs() << "\n***\n";
                                        lastUser = U;
                                }
	return lastUser;
}

void interchangeLoopIndex(BasicBlock* OuterLoopPreHeader, BasicBlock* OuterLoopHeader, BasicBlock* OuterLoopLatch,
                                BasicBlock* InnerLoopPreHeader, BasicBlock* InnerLoopHeader, BasicBlock* InnerLoopLatch){

	//Interchange the index variables
        Value* OuterLoopIndex = getLoopIndexVar(OuterLoopPreHeader);
        Value* InnerLoopIndex = getLoopIndexVar(InnerLoopPreHeader);

        //errs() << "OuterLoop Index " << *OuterLoopIndex << "\n";
        //errs() << "InnerLoop Index " <<  *InnerLoopIndex << "\n";

        User* OuterLoopUser = getLastUser(OuterLoopIndex);
        User* InnerLoopUser = getLastUser(InnerLoopIndex);

        OuterLoopUser->setOperand(1, InnerLoopIndex);
        InnerLoopUser->setOperand(1, OuterLoopIndex);


	//Interchange the index values
	Value* OuterLoopIndexVal = getLoopIndexVal(OuterLoopPreHeader);
	Value* InnerLoopIndexVal = getLoopIndexVal(InnerLoopPreHeader);

	OuterLoopUser->setOperand(0, InnerLoopIndexVal);
	InnerLoopUser->setOperand(0, OuterLoopIndexVal);
}

void makeBranch(BasicBlock* src, BasicBlock* dest){
	Instruction* I = src->getTerminator();
	if(auto* BI = dyn_cast<BranchInst>(I)){
		BI->setSuccessor(0, dest);	
		return;
	}
	
	errs() << "\n Link failed from " << *src << "to" << *dest << "\n";
}

void makeBranches(BasicBlock* src, BasicBlock* dest1, BasicBlock* dest2){
        Instruction* I = src->getTerminator();
        if(auto* BI = dyn_cast<BranchInst>(I)){
                BI->setSuccessor(0, dest1);
		BI->setSuccessor(1, dest2);
        	return;
	}

        errs() << "\n Link failed from " << *src << "to" << *dest1 << "\n";
}

BasicBlock* getExitBlock(BasicBlock* bb){
	BasicBlock* ret = NULL;
	Instruction* I = bb->getTerminator();
	if(auto* BI = dyn_cast<BranchInst>(I)){
                ret = BI->getSuccessor(1);
        }
	return ret;
}
BasicBlock* getOuterLoopBBS(BasicBlock* bb){
	BasicBlock* ret = NULL;
        Instruction* I = bb->getTerminator();
        if(auto* BI = dyn_cast<BranchInst>(I)){
                ret = BI->getSuccessor(1);
        }
        return ret;
}

void interchangeLoops(BasicBlock* OuterLoopPreHeader, BasicBlock* OuterLoopHeader, BasicBlock* OuterLoopBBS, BasicBlock* OuterLoopLatch,
                                BasicBlock* InnerLoopPreHeader, BasicBlock* InnerLoopHeader, BasicBlock* InnerLoopLatch,
					 BasicBlock* InnerLoopHeaderNextBlock, BasicBlock* InnerLoopLatchPreBlock, BasicBlock* ExitBlock){
	
	//interchange loop index variables and value
	interchangeLoopIndex(OuterLoopPreHeader, OuterLoopHeader, OuterLoopLatch, InnerLoopPreHeader, InnerLoopHeader, InnerLoopLatch);


	//interchange loop basicblocks
	OuterLoopHeader->moveAfter(InnerLoopPreHeader);
	InnerLoopHeader->moveBefore(InnerLoopPreHeader);

	//interchange latch basicblocks
	InnerLoopLatch->moveAfter(OuterLoopBBS);
	OuterLoopLatch->moveBefore(OuterLoopBBS);
	
	//Swap my data structures
	BasicBlock* NewOuterLoopHeader = InnerLoopHeader;
	BasicBlock* NewInnerLoopHeader = OuterLoopHeader;
	
	BasicBlock* NewInnerLoopLatch = OuterLoopLatch;
	BasicBlock* NewOuterLoopLatch = InnerLoopLatch;

	// Correct the links/branches
	makeBranch(OuterLoopPreHeader, NewOuterLoopHeader);	
	makeBranches(NewOuterLoopHeader, InnerLoopPreHeader, ExitBlock);	
	makeBranch(InnerLoopPreHeader, NewInnerLoopHeader);
	makeBranches(NewInnerLoopHeader, InnerLoopHeaderNextBlock, OuterLoopBBS);

	makeBranch(InnerLoopLatchPreBlock, NewInnerLoopLatch);
	makeBranch(NewInnerLoopLatch, NewInnerLoopHeader);
	makeBranch(OuterLoopBBS, NewOuterLoopLatch);

}


bool do_assignment3(map<string, BasicBlock*>& _blockMap, set<string>& blocks, map<int, set<string>>& _loopMap, int innerLoopIndex, int outerLoopIndex, int run){

	map<int, BasicBlock*> blockMap;
	map<int, set<int>> loopMap;

	for(auto it : _blockMap){
		blockMap[stoi(it.first)] = it.second;
	}
	
	for(auto it : _loopMap){
		set<int> loop;
		for(auto l : it.second)
			loop.insert(stoi(l));
		
		loopMap[(it.first)] = loop;
	}

        vector<int> OuterLoopBlocks = to_vec(loopMap[outerLoopIndex]);
        vector<int> InnerLoopBlocks = to_vec(loopMap[innerLoopIndex]);

        //Debug
        errs() << "Outer Loop : ";
        for(auto& b : OuterLoopBlocks)
                errs() << b << " ";

        errs() << "Inner Loop : ";
        for(auto& b : InnerLoopBlocks)
                errs() << b << " ";
        errs() << "\n";

        BasicBlock* OuterLoopPreHeader = getLoopPreheader(blockMap[OuterLoopBlocks[0]]);
       	BasicBlock* OuterLoopHeader = blockMap[OuterLoopBlocks[0]];
        BasicBlock* OuterLoopLatch = blockMap[OuterLoopBlocks[OuterLoopBlocks.size()-1]];


        BasicBlock* InnerLoopPreHeader = getLoopPreheader(blockMap[InnerLoopBlocks[0]]);
        BasicBlock* InnerLoopHeader = blockMap[InnerLoopBlocks[0]];
        BasicBlock* InnerLoopLatch = blockMap[InnerLoopBlocks[InnerLoopBlocks.size()-1]];

	BasicBlock* InnerLoopHeaderNextBlock = blockMap[InnerLoopBlocks[1]];
	BasicBlock* InnerLoopLatchPreBlock = blockMap[InnerLoopBlocks[InnerLoopBlocks.size()-2]];
	
	BasicBlock* ExitBlock = getExitBlock(OuterLoopHeader);
	BasicBlock* OuterLoopBBS = getOuterLoopBBS(InnerLoopHeader);
	
        //printBB(OuterLoopPreHeader);
        //printBB(OuterLoopHeader);
        //printBB(InnerLoopPreHeader);
        //printBB(InnerLoopHeader);
        //printBB(InnerLoopLatch);
	//printBB(OuterLoopBBS);
	//printBB(OuterLoopLatch);
	//printBB(ExitBlock);	

	getLoopParameters(blockMap, blocks, loopMap, innerLoopIndex, outerLoopIndex, OuterLoopPreHeader, OuterLoopHeader, OuterLoopLatch, InnerLoopPreHeader, InnerLoopHeader, InnerLoopLatch);
	
	bool isPerfectNested = perfectlyNested(OuterLoopPreHeader, OuterLoopHeader, OuterLoopBBS, OuterLoopLatch, InnerLoopPreHeader, InnerLoopHeader, InnerLoopLatch);	
	errs() << "Perfectly Nested : " << isPerfectNested << "\n";	

	bool bLoopDependent = areLoopDependent(OuterLoopPreHeader, OuterLoopHeader, OuterLoopLatch, InnerLoopPreHeader, InnerLoopHeader, InnerLoopLatch);
	errs() << "Are Loop dependent : " << bLoopDependent << "\n";	

	if(isPerfectNested && !bLoopDependent && changeIR(run))
		interchangeLoops(OuterLoopPreHeader, OuterLoopHeader, OuterLoopBBS, OuterLoopLatch, InnerLoopPreHeader, InnerLoopHeader, 
				InnerLoopLatch, InnerLoopHeaderNextBlock, InnerLoopLatchPreBlock, ExitBlock);


	errs() << "\n~~~~~~~~~~~~~~~~~~~~~$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n";	
}

bool changeIR(int run){
	// SOme logic to verify result
	if(run == 1){errs() << "Skipping Loop Interchange for this\n"; return false;}
	return true;
}
