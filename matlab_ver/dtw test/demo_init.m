disp('���ڼ���ο�ģ��Ĳ���...')
fname=sprintf('./mom/%d.wav',1);
[x fs]=wavread(fname);
[x1 x2]=vad(x);
m=mfcc(x,fs);
m=m(x1-2:x2-2,:);
mr=m;
    

disp('���ڼ������ģ��Ĳ���...')
fname=sprintf('./mom/%d.wav',2);
[x fs]=wavread(fname);
[x1 x2]=vad(x);
m=mfcc(x,fs);
m=m(x1-2:x2-2,:);
mt=m;
    
disp('���ڽ���ģ��ƥ��...')
dist=zeros(5);
for j=1:5
    dist(j)=dtw(mt,mr);
end
 
disp('���ڼ���ƥ����...')
[d,j]=min(dist(:,1));
fprintf('����ģ���ʶ����Ϊ��%d\n',min(mean(dist)));
