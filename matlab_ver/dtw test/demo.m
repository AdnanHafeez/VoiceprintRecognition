function demo(name1, name2)
disp('���ڼ���ο�ģ��Ĳ���...')
model = train(name1, 5);
for i=1:5
    ref(i).mfcc=model(i).mfcc;
end

disp('���ڼ������ģ��Ĳ���...')
for i=1:5
    fname=sprintf('./%s/%d.wav',name2, i);
    [x fs]=wavread(fname);
    %[x1 x2]=vad(x,fs);
    [x1 x2]=vad(x);
    m=mfcc(x,fs);
    m=m(x1-2:x2-2,:);
    test(i).mfcc=m;
end

disp('���ڽ���ģ��ƥ��...')
dist=zeros(5,5);
for i=1:5
    for j=1:5
        dist(i,j)=dtw(test(i).mfcc,ref(j).mfcc);
    end
end
 
disp('���ڼ���ƥ����...')
for i=1:5
    %d������Сֵ��jΪ��Сֵ�±�
    %[d,j]=min(dist(i,:));
    d=mean(dist(i,:))
    fprintf('����ģ��%d��ʶ�����Ϊ��%d\n',i,d);
end