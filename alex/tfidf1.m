function [fea2] = tfidf1(fea)

[nSmp,nFea] = size(fea);
[idx,jdx,vv] = find(fea);

df = full(sum(sparse(idx,jdx,1),1));
idf = log(nSmp./df);

for i=1:nSmp
tf(i,:)=sparse(fea(i,:)/sum(fea(i,:))); % max or sum
   %  if (mod(i,50)==0)
   %   fprintf('eimai stinn %d grammi\n', i)
  %   end
end
for j=1:nFea
fea2(:,j)=sparse(tf(:,j) * idf (j));
     %if (mod(j,100)==0)
    %  fprintf('eimai stinn %d stili\n', j)
     %end
end
 
fea2=sparse(fea2);

end