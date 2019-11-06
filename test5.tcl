#Load testing network:
source ecog_deep_test.in

#Load commands for writing unit activations
source mr_procs.tcl

#Load testing examples
loadExamples ecog_train_p9_e0_8int.ex -exmode ORD

#Load each set of learned weights, then run model and record unit activations
loadWeights "deep_p9_run1_30k.wt.gz"
testAllFinalActs "deep_p9_run1_30k_rep_8int.out" hidden

loadWeights "deep_p9_run2_30k.wt.gz"
testAllFinalActs "deep_p9_run2_30k_rep_8int.out" hidden

loadWeights "deep_p9_run3_30k.wt.gz"
testAllFinalActs "deep_p9_run3_30k_rep_8int.out" hidden

loadWeights "deep_p9_run4_30k.wt.gz"
testAllFinalActs "deep_p9_run4_30k_rep_8int.out" hidden

loadWeights "deep_p9_run5_30k.wt.gz"
testAllFinalActs "deep_p9_run5_30k_rep_8int.out" hidden
