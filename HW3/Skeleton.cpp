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
#include "./LoopInterChange.h"

using namespace llvm;
using namespace std;

namespace {
struct SkeletonPass : public FunctionPass {
    static char ID;

    SkeletonPass() : FunctionPass(ID) 
    {
    }

    struct Flowgraph
    {
        map<string, BasicBlock*> blockMap;
        map<string, set<string>> preds;
        set<pair<string, string>> edges;
	set<string> blocks;	
    };

    virtual bool runOnFunction(Function& F) 
    {
        errs() << "\n ********* Printing Loops for Function : " << F.getName() << "******\n";

        /*
        Step 1:
        •  Construct flowgraph and compute the dominance relation for it.
        */
        
        Flowgraph graph = construct_flowgraph(F);
        map<string, set<string>> dominTree;
        errs() << "Total basic blocks in the function : " << graph.blocks.size() << "\n";
        if(graph.blocks.size() > 0)
        {
            auto entryBlock = graph.blocks.begin();
            dom_comp(dominTree, graph.preds, graph.blocks, *entryBlock);
        }

        // Step 2 : Find backward edges
        vector<pair<string, string>> backwardedges = find_backwardedges(graph.edges, dominTree);
        
        // Step 3 : Construct loops
        map<int, set<string>> loopMap;
        set<set<string>> loops = find_loops(backwardedges, graph.preds, loopMap);
        
        errs() << "\nNumber of loops = Backward edges : " << backwardedges.size() << "\n";

        print_loops(loopMap, graph.blockMap);

        bool return_assignment3 = find_nestedLoops(graph, loopMap);
       
	return return_assignment3;;
    }

    /*
    Step 1:
    •  Construct flowgraph and compute the dominance relation for it.
    */

    Flowgraph construct_flowgraph(Function& F)
    {
        Flowgraph graph;
        int countBlock = 0;
        for(auto& B: F) 
        {
            // Fill blocks
            B.setName(Twine(to_string(countBlock)));    // Block name is coming empty.
            graph.blocks.insert(B.getName());
            graph.blockMap[B.getName()] = &B;
            // errs() << B.getName() << "\n";
            countBlock++;
        }

    	for(auto& B: F)
    	{
            // Fill predecessors and edges
            for (auto it = pred_begin(&B), et = pred_end(&B); it != et; ++it)
            {
                BasicBlock* predecessor = *it;
                graph.preds[B.getName()].insert(predecessor->getName());
                graph.edges.insert(make_pair(predecessor->getName(), B.getName()));
            }            
        }
        return graph;
    }

    // https://stackoverflow.com/questions/13448064/how-to-find-the-intersection-of-two-stdset-in-c
    set<string> intersection(set<string>& A, set<string>& B)
    {
        set<string> ret;
        std::set_intersection(A.begin(), A.end(), B.begin(), B.end(), std::inserter(ret, ret.begin()));
        return ret;
    }


    set<string> findallintersections(set<string>& preds, set<string>& blocks, map<string, set<string>>& dominatorTree)
    {
        set<string> ret = blocks;
        for(auto pred:preds)
        {
            ret = intersection(ret, dominatorTree[pred]);
        }
        return ret;
    }

    bool relaxAllBlocks(set<string> blocks, map<string, set<string>> preds, map<string, set<string>>& dominTree, string entryNode)
    {
        int unstablecount = blocks.size()-1;
        // run for all nodes except entryNode
        for(auto block: blocks)
        {
            if(block==entryNode)continue;
            set<string> bk = dominTree[block];

            dominTree[block] = findallintersections(preds[block], blocks, dominTree);


            dominTree[block].insert(block);

            if(bk == dominTree[block])unstablecount--;
        }
        return unstablecount != 0;
    }

    // Page - 182 : Advanced Compiler Design and Implementation.pdf by Steven Muchnick
    void dom_comp(map<string, set<string>>& dominTree, map<string, set<string>> preds, set<string> blocks, string entryBlock)
    {
        if(blocks.size()==0)return;

        for(auto block:blocks)
        {
            dominTree[block] = blocks;
        }

        dominTree[entryBlock] = set<string>{entryBlock};

        while(relaxAllBlocks(blocks, preds, dominTree, entryBlock));
    }

    /*
    Step 2 :
    •  find each node s in flowgraph for which there
    is a node n such that
    •  s <= n in dominance relationship and •  (n,s) is an edge in flowgraph.
     Each such node s is a loop entry point and (n,s) is a backward edge
    */

    vector<pair<string, string>> find_backwardedges(set<pair<string, string>> edges, map<string, set<string>> dominatorTree)
    {
        vector<pair<string, string>> backwardedges;
        for(auto edge: edges) 
        {
            string n = edge.first; string s = edge.second;
            // Consider only backward edge in dominator graph
            if(dominatorTree[n].find(s) != dominatorTree[n].end())
                backwardedges.push_back(edge);
        }
        return backwardedges;
    }

    /*
    Step 3: Construction
    Construct natural loop associated with s and (n,s). It is characterized by its nodes N’⊆ N
    •  Enter entry point s and node n at the other end of the backward edge into N’.
    •  Then include the predecessors of n.
    •  Continue by adding all the predecessors of nodes that are in the loop, except for the predecessors of the entry point, until there are no more such nodes.
    */
    void dfsutil(string node, set<string>& loop, map<string, set<string>> preds)
    {
        loop.insert(node);
        for(auto pre : preds[node])
        {
            if(loop.find(pre) == loop.end())
                dfsutil(pre, loop, preds);
        }
    }

    // Page - 192 : Advanced Compiler Design and Implementation.pdf by Steven Muchnick
    set<set<string>> find_loops(vector<pair<string, string>> backwardedges, map<string, set<string>> preds, map<int, set<string>>& loopMap){
	
        set<set<string>> loops;
        for(auto edge:backwardedges)
        {
            set<string> loop;
            loop.insert(edge.second);
            dfsutil(edge.first, loop, preds);
            loopMap[loops.size()] = loop;
            loops.insert(loop);
        }
        return loops;
    }

    /*
    Utilities
    */
    
    void print_loops(map<int, set<string>>& loopMap, map<string, BasicBlock*>& blockMap) 
    {
        errs() << "\n\nLoop Info\n";
        errs() << "----------\n";
        for(auto it:loopMap) 
        {
            errs() << "Loop " << it.first << ": ";
            //for(auto blockid: it.second) 
            //    errs() << blockid << " ";
        
            errs() << "Block Count : " << it.second.size() << " ";
            int countInst = 0;
            for(auto blockid: it.second)
            {   
                for(auto &I: *blockMap[blockid])countInst++;    
            }
            
            errs() << "Instructions : " << countInst << "\n";
        }
    }

    bool find_nestedLoops(Flowgraph& graph, map<int, set<string>>& loopMap)
    {
	int run = 0;
        errs() << "\n\nNested Relationship \n";
        errs() << "------------------------\n";
        for(auto it1: loopMap)
        {
            for(auto it2: loopMap)
            {
                if(it1 == it2)continue;
                auto common = intersection(it1.second, it2.second);
                if(it1.second == common)
                {			
			    errs() << "Loop " << it1.first << " is nested within " << it2.first << "\n";
			    do_assignment3(graph.blockMap, graph.blocks, loopMap, it1.first, it2.first, run++);
		}
            }
        }
	return true;
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


