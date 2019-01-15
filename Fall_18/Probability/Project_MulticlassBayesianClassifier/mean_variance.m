clc;
clear;
%loading the data
load('data.mat');

%Step 1 and 2 is coded into predict_accuracy.m

%CASE1 , X = F1 
[F1classification_accuracy, F1_prediction] = predict_accuracy(F1);
F1error_rate = 1 - F1classification_accuracy;
disp(['F1 classification accuracy : ',num2str(F1classification_accuracy)])
disp(['F1 error rate : ',num2str(F1error_rate)])

%Step 3, Normalizing data
Z1 = normalize(F1')';
% Plot: 
plot(Z1(:,1), F2(:,1),'o','markersize',5,'color','red');
hold on
plot(Z1(:,2), F2(:,2),'o','markersize',5,'color','black');
hold on
plot(Z1(:,3), F2(:,3),'o','markersize',5,'color','green');
hold on
plot(Z1(:,4), F2(:,4),'o','markersize',5,'color','blue');
hold on
plot(Z1(:,5), F2(:,5),'o','markersize',5,'color','magenta');
xlabel('Z1')
ylabel('F2')
legend('C1','C2','C3','C4','C5')


%Step 4
%CASE2: X = Z1
[Z1classification_accuracy, Z1_prediction] = predict_accuracy(Z1);
Z1error_rate = 1 - Z1classification_accuracy;

disp(['Z1 classification accuracy : ',num2str(Z1classification_accuracy)])
disp(['Z1 error rate : ',num2str(Z1error_rate)])

%CASE3: X = F2
[F2classification_accuracy, F2_prediction] = predict_accuracy(F2);
F2error_rate = 1 - F1classification_accuracy;

disp(['F2 classification accuracy : ',num2str(F2classification_accuracy)])
disp(['F2 error rate : ',num2str(F2error_rate)])
%================================================================================
%CASE4 : X = [Z1 F2]'

%calculating mean and covariance matrix using 1st 100 data points for each column
%mul_mean = [0;0]; 
mul_mean(:,1) = mean(Z1(1:100,:));
mul_mean(:,2) = mean(F2(1:100,:));
mul_cov = zeros(2,2,5);
mul_cov(:,:,1) = cov(Z1(1:100,1),F2(1:100,1));
mul_cov(:,:,2) = cov(Z1(1:100,2),F2(1:100,2));
mul_cov(:,:,3) = cov(Z1(1:100,3),F2(1:100,3));
mul_cov(:,:,4) = cov(Z1(1:100,4),F2(1:100,4));
mul_cov(:,:,5) = cov(Z1(1:100,5),F2(1:100,5));

%Making test set
Z1_test = Z1(101:1000,:);
F2_test = F2(101:1000,:);

%initializing prediction matrix
[nrows, ncols] = size(Z1_test);
prediction = zeros(nrows, ncols);

%set actual class(to match with predicted values) for the test data
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
            c1_prob = mvnpdf([Z1_test(row,col) F2_test(row, col)], mul_mean(i,:), mul_cov(:,:,i));
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
mul_classification_accuracy = error/4500;

disp(['Classification accuracy for multivaraite (Z1, F2): ',num2str(mul_classification_accuracy)])
disp(['Classification error rate for multivaraite (Z1, F2) : ',num2str(1- mul_classification_accuracy)])