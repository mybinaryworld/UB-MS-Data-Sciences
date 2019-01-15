
%Part(a)
fileID = fopen('house_names.txt');
house_name = textscan(fileID,'%s','delimiter','\n');
fclose(fileID);
house_name = house_name{1,1};
house_vote = load('house_votes.txt');
house_parties = load('house_parties.txt');


%Part(b)
figure
[U, S, V] = svd(house_vote);
plot(diag(S),'o', 'MarkerFaceColor', 'g')
legend('Singular values')

%Part(c)
figure
gscatter(U(:,1),U(:,2),house_parties)
legend('Democrat','Republican','Independent','Location','northeast')
title('u1 vs u2');
xlabel('u1');
ylabel('u2');

%Part(e)
[lU, lS, lV] = svds(house_vote,2);
lU(:,1) = lU(:,1);
lhouse_vote = U*S*V';
lhouse_vote(lhouse_vote>0) = 1;
lhouse_vote(lhouse_vote<=0) = -1;

correct_pred = zeros(length(lhouse_vote(:,1)),1);
for i =1:length(lhouse_vote(:,1))
    correct_pred(i) = sum(lhouse_vote(i,:) == house_vote(i,:));
end
total_matches = sum(correct_pred)
frac_correct_pred = total_matches/numel(lhouse_vote)
figure
plot(lU(:,1),correct_pred/length(lhouse_vote(1,:)),'bo');
title('u1 VS fraction of correct predictions')
xlabel('u1')
ylabel('fraction of correct predictions')
%set(gca,'xtick',1:length(correct_pred),'xticklabel',senate_name)
%xtickangle(90)
