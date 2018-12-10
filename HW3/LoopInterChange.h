#include <string>
#include <set>
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

using namespace llvm;
using namespace std;


bool do_assignment3(map<string, BasicBlock*>& blockMap, set<string>& blocks, map<int, set<string>>& loopMap, int outerLoopIndex, int innerLoopIndex, int run);
