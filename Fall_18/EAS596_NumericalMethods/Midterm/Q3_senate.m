
%Part(a)
fileID = fopen('senate_names.txt');
senate_name = textscan(fileID,'%s','delimiter','\n');
fclose(fileID);
senate_name = senate_name{1,1};
senate_vote = load('senate_votes.txt');
senate_parties = load('senate_parties.txt');


%Part(b)
figure
[U, S, V] = svd(senate_vote);
plot(diag(S),'o', 'MarkerFaceColor', 'g')
legend('Singular values')

%Part(c)
figure
gscatter(U(:,1),U(:,2),senate_parties)
legend('Democrat','Republican','Independent','Location','northeast')
title('u1 vs u2');
xlabel('u1');
ylabel('u2');

%Part(e)
[lU, lS, lV] = svds(senate_vote,2);
lU(:,1) = -lU(:,1);
lsenate_vote = U*S*V';
lsenate_vote(lsenate_vote>0) = 1;
lsenate_vote(lsenate_vote<=0) = -1;

correct_pred = zeros(length(lsenate_vote(:,1)),1);
for i =1:length(lsenate_vote(:,1))
    correct_pred(i) = sum(lsenate_vote(i,:) == senate_vote(i,:));
end
total_matches = sum(correct_pred)
frac_correct_pred = total_matches/numel(lsenate_vote)
figure
plot(lU(:,1),correct_pred/length(lsenate_vote(1,:)),'bo');
title('u1 VS fraction of correct predictions')
xlabel('u1')
ylabel('fraction of correct predictions')
set(gca,'xtick',1:length(senate_name),'xticklabel',senate_name)
%xtickangle(90)
