Data=[feat_pos,feat_neg];
Labels=[ones(1,counter), -1*ones(1,counter1)];
disp('Training started.....');
weak_learner = tree_node_w(1); % pass the number of tree splits to the constructor
[RLearners RWeights]=GentleAdaBoost(weak_learner, Data, Labels, 10);
disp('Training completed.....');
