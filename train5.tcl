#Load training network:
source ecog_deep.in

#Load commands for writing unit activations
source mr_procs.tcl

setObj numUpdates 30000

#Load the training and testing examples
deleteExampleSets *
loadExamples ecog_train_p9_e0.ex -exmode PER -set train
loadExamples ecog_train_p9_e0.ex -exmode PER -set test

steepest
saveWeights "deep_p9_run1_30k.wt.gz"
testAllFinalActs "deep_p9_run1_30k_rep.out" hidden
resetNet

steepest
saveWeights "deep_p9_run2_30k.wt.gz"
testAllFinalActs "deep_p9_run2_30k_rep.out" hidden
resetNet

steepest
saveWeights "deep_p9_run3_30k.wt.gz"
testAllFinalActs "deep_p9_run3_30k_rep.out" hidden
resetNet

steepest
saveWeights "deep_p9_run4_30k.wt.gz"
testAllFinalActs "deep_p9_run4_30k_rep.out" hidden
resetNet

steepest
saveWeights "deep_p9_run5_30k.wt.gz"
testAllFinalActs "deep_p9_run5_30k_rep.out" hidden



