function [a] = somActivation(patterns,neighborDist)

global  distances;

%distances=������� NxN ��� �������� ��� �������� ���� ������� ��� ����� ��� ���������� ��������
%max_position=� ���� ��� ������ �������
%winning_distance=� �������� ��� ������ ������� ��� ���� ������
%��� �������� �� ���� � �������� ����� ��������� ��� neighborDist(�
%�������� �������� ��� �� �������� ���������� ���� ��������) ���� �� ����
%����� ��� �������� �������� 0.5 ������ 0

[~,max_position]=max(somOutput(patterns));
winning_distance=distances(max_position,:);


winning_distance=winning_distance<=neighborDist;
winning_distance(find(winning_distance==max(winning_distance)))=0.5;

winning_distance(max_position)=1;

a=winning_distance;


end