clc;
clear all;
close all;

ranges = [1 30; 31 59; 60 63; 64 100; 101 130; 131 159; 160 200; 201 255];
frequencies = [2048, 2048, 2048, 2048, 819, 819, 3277, 3277];
probabilities = frequencies / sum(frequencies); % Normalize to get probabilities

% Sort probabilities and ranges in descending order
[probabilities, idx] = sort(probabilities, 'descend');
ranges = ranges(idx, :);

% Initialize the codes
codes = cell(1, length(probabilities));
cumulative_probs = cumsum(probabilities);

% Shannon-Fano coding logic
for i = 1:length(probabilities)
    if i == 1
        codes{i} = '0';
    elseif i == length(probabilities)
        codes{i} = '1';
    else
        half_sum = sum(probabilities) / 2;
        if cumulative_probs(i-1) < half_sum && cumulative_probs(i) >= half_sum
            codes{i} = '1';
        else
            codes{i} = '0';
        end
        if mod(i, 2) == 0
            codes{i} = strcat(codes{i-1}, '1');
        else
            codes{i} = strcat(codes{i-1}, '0');
        end
    end
end

% Display the Shannon-Fano codes
for i = 1:length(codes)
    fprintf('Range: %d-%d, Code: %s\n', ranges(i, 1), ranges(i, 2), codes{i});
end