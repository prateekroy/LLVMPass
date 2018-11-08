#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Operator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
using namespace llvm;

namespace {
  struct SkeletonPass : public FunctionPass {
    static char ID;
    int countOperator;
    int countBranch;
    int countMemory;
    SkeletonPass() : FunctionPass(ID) {
      	countOperator=0;
	countBranch=0;
	countMemory=0;
    }

// Reference : http://llvm.org/doxygen/Instruction_8cpp_source.html#l00291
    virtual bool runOnFunction(Function &F) {
      for (auto &B : F) {
        for (auto &I : B) {
          if (auto *op = dyn_cast<BinaryOperator>(&I)) {
          	countOperator++;
	  }
	  if(  dyn_cast<BranchInst>(&I) || dyn_cast<TerminatorInst>(&I) ){
		countBranch++;	
	  }
          
	  if(dyn_cast<AllocaInst>(&I) || dyn_cast<LoadInst>(&I) || dyn_cast<StoreInst>(&I) || dyn_cast<AtomicCmpXchgInst>(&I)  || dyn_cast<AtomicRMWInst>(&I) || dyn_cast<FenceInst>(&I) || dyn_cast<GetElementPtrInst>(&I) ){
                countMemory++;
          }

	  }
      }
      errs() << F.getName() << " Operator : " <<  countOperator << " Branch : " << countBranch << " Memory : " << countMemory << "\n";
      countOperator = 0;countBranch = 0;countMemory=0;
      return false;
    }
  };
}

char SkeletonPass::ID = 0;

// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
static void registerSkeletonPass(const PassManagerBuilder &,
                         legacy::PassManagerBase &PM) {
  PM.add(new SkeletonPass());
}

// Reference : http://llvm.org/docs/WritingAnLLVMPass.html
static RegisterPass<SkeletonPass> X("mypass", "My Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);
