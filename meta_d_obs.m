function [meta_d,fit] = meta_d_obs(Data)

% ----------------------------
% Author : Atesh Koul
% Italian Institute of technology, Genoa
% ----------------------------

for i = 1:numel(unique(Data(:,1)))
     confData = Data(Data(:,1)==i,2:end);
     [p,q] = trials2counts(confData(:,3),confData(:,2),confData(:,1),4,1);
     fit{i} = fit_meta_d_MLE(p,q);
     meta_d(i) = fit{i}.meta_da;
end
