% A specific script

% ----------------------------
% Author : Atesh Koul
% Italian Institute of technology, Genoa
% ----------------------------




% For Frontale :
for i = 1:numel(a)
    if i ==7
        % Substitute a null value to represent that this subject is missing
        meta_d{i} = [NaN NaN NaN NaN NaN NaN NaN NaN];
        i = i+1;
    end
       
    % loads the data in the matrix
    Data = a{i};
    % calculates the meta-d' and fit structure
    [meta_d{i},fit{i}]=meta_d_obs(Data);
    % The fmin value is not defined for the subject no. 7 (i.e subject 8)

end

% concatanate all the values
meta_d_all_sub=cat(1,meta_d{:});


% For Laterale :
for i = 1:numel(a)
    if i ==8
        % Substitute a null value to represent that this subject is missing
        meta_d{i} = [NaN NaN NaN NaN NaN NaN NaN NaN];
        i = i+1;
    end
       
    % loads the data in the matrix
    Data = a{i};
    % calculates the meta-d' and fit structure
    [meta_d{i},fit{i}]=meta_d_obs(Data);
    % The fmin value is not defined for the subject no. 7 (i.e subject 8)

end

% concatanate all the values
meta_d_all_sub=cat(1,meta_d{:});




for i = 1:numel(a)
%     if i ==7
%         % Substitute a null value to represent that this subject is missing
%         meta_d{i} = [NaN NaN NaN NaN NaN NaN NaN NaN];
%         i = i+1;
%     end
       
    % loads the data in the matrix
    Data = a{i};
    % calculates the meta-d' and fit structure
    [meta_d{i},fit{i}]=meta_d_obs_SSE(Data);
    % The fmin value is not defined for the subject no. 7 (i.e subject 8)

end

% concatanate all the values
meta_d_all_sub=cat(1,meta_d{:});













% Other misc stuff




for i = 1:13
Data = a{i};
[meta_d{i},fit{i}]=meta_d_obs(Data);
end

for i = 15:numel(a)
Data = a{i};
[meta_d{i},fit{i}]=meta_d_obs(Data);
end

meta_d_all_sub=cat(1,meta_d{:});

% calculating all the other parameters for SSE calculation
for i=1:numel(fit)
    for j = 1:8
        fit_ratio(i,j) = 1/fit{1,i}{1,j}.M_ratio;
        fit_da(i,j) = fit{1,i}{1,j}.da;
        fit_meta_da(i,j) = fit{1,i}{1,j}.meta_da;
        fit_meta_diff(i,j) = fit{1,i}{1,j}.M_diff;
        
        
    end
end





% checking with 120 trials - the idea was that after the 120 trials, the
% block changes which might have an effect. This however is wrong and the
% type 1 d' values calculated are not consistant with what was calculated
% before.
for i = 1:13
Data = a{i}(121:240,:);
[meta_d{i},fit{i}]=meta_d_obs(Data);
end

for i = 15:numel(a)
Data = a{i}(121:240,:);
[meta_d{i},fit{i}]=meta_d_obs(Data);
end

