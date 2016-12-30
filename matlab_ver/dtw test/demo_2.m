function demo_2(name1, num1, name2, num2)
disp('���ڼ���ο�ģ��Ĳ���...')
model = train(name1, num1);
for i=1:num1
    ref(i).mfcc=model(i).mfcc;
end

disp('���ڼ������ģ��Ĳ���...')
for i=1:num2
    fname=sprintf('./%s/%d.wav',name2, i);
    [x fs]=wavread(fname);
    %[x1 x2]=vad(x,fs);
    [x1 x2]=vad(x);
    m=mfcc(x,fs);
    m=m(x1-2:x2-2,:);
    test(i).mfcc=m;
end

disp('���ڽ���ģ��ƥ��...')
dist=zeros(num2,num1);
for i=1:num2
    for j=1:num1
        dist(i,j)=dtw(test(i).mfcc,ref(j).mfcc);
    end
end
 
disp('���ڼ���ƥ����...')
for i=1:num2
    %d������Сֵ��jΪ��Сֵ�±�
    %[d,j]=min(dist(i,:));
    d=mean(dist(i,:))
    fprintf('����ģ��%d��ʶ�����Ϊ��%d\n',i,d);
end