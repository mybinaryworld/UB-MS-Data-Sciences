function [classification_accuracy, prediction] = predict_accuracy(F1)

%calculating mean and standard devaition using 1st 100 data points for each column
F1mean = mean(F1(1:100,:));
F1std = std(F1(1:100,:));

%Making test set
F1_test = F1(101:1000,:);

%initializing prediction matrix
[nrows, ncols] = size(F1_test);
prediction = zeros(nrows, ncols);

%set actual class(used to match with predicted values) for the test data
actual = zeros(nrows, ncols);
actual(:,1) = 1;
actual(:,2) = 2;
actual(:,3) = 3;
actual(:,4) = 4;
actual(:,5) = 5;
for row = 1:nrows
    for col = 1:ncols
        max_prob=0;
        predicted_class = 0;
        for i = 1:5
            c1_prob = normpdf(F1_test(row, col), F1mean(i), F1std(i));
            if c1_prob > max_prob
                max_prob = c1_prob;
                predicted_class = i;
            end
        end
        prediction(row, col) = predicted_class;
    end
end

%Calculating error
error_mat = actual - prediction;
idx=error_mat==0; %returns 1 at position where value is zero and zeros everywhere else
error=sum(idx(:));
classification_accuracy = error/4500;