function code = train(traindir, n)

k = 16;                         % number of centroids required
for i = 1:n                     % �����ݿ��еĴ����γ��뱾
    file = sprintf('%s%d.wav', traindir, i);           
    disp(file);
    [s, fs] = wavread(file);
    v = mfcc(s, fs);            % ���� MFCC's ��ȡ��������������ֵ��Mel����ϵ������һ��log��dct�õ���
    code{i} = vqlbg(v, k);      % ѵ��VQ�뱾  ͨ��ʸ���������õ�ԭ˵���˵�VQ�뱾
end
