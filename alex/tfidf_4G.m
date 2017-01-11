
global IW patterns titles terms;
patterns=Patterns;

%% 4Gi
for i=1:500
    winner(i,:) = somOutput(patterns(i,:));
end
%briskw kathena apo tous nikites neurwnes
winner = sum(winner,1); % arithmos eggrafwn gia kathe neurwna
num_records = reshape(winner,10,10);
save('num_records')

%% 4Gii

apostaseis = dist(IW, patterns'); %apostaseis eggrafwn gia kathe neurwna
[min_apostaseis,indexes] = min(apostaseis,[],2); %minimum & indexes
min_dist_titles = titles(indexes); %antistoixisi se titlous
save('min_dist_titles')

%% 4Giii

[weights,indexes1] = sort(IW,2); %sortaroume ta varh gia kathe neurwna
indexes_max = indexes1(:,8294:8296); %kratame ta indexes twn 3 megaluterwn varwn
max_weight_terms = terms(indexes_max); % antistoixizoume sta terms
save('max_weight_terms')

%% 4Giv

%network=1 function=7

weights_max_network = 0.3*max(IW(:,1)); %max varos gia network
weights_max_function = 0.3*max(IW(:,7));
apotelesma1 = (IW(:,1)>= weights_max_network);  
apotelesma2 = (IW(:,7)>= weights_max_function);
apotelesma = apotelesma1 & apotelesma2;
neural_net_fun = reshape(apotelesma,10,10);
save('neural_net_fun')

%% 4Gv

unique_terms = unique(indexes_max); %oi oroi tou vhmatos iii pou emfanizontai monadika
unique_names = terms(unique_terms);
max_varos = max(IW(:,unique_terms),[],1);
mean_varos = mean(IW(:,unique_terms),1);
pososto = mean_varos ./ max_varos * 100;
pososto = pososto';
percentage = round(pososto*100)/100;
save('percentage')