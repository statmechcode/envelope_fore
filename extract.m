clear
S=rsac('a.SAC');
S(:,3)=[];
S(:,1)=[];
b=cat(1,S);
save('a.dat', 'b','-ascii','-tabs')

