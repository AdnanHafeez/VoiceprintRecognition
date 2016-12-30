function finalmsg = test(testdir, n, code)

for k = 1:n   % read test sound file of each speaker
  file = sprintf('%s%d.wav', testdir, k);
  [s, fs] = wavread(file);      
        
  v = mfcc(s, fs);  % �õ�������������mel����ϵ��
  distmin = 4;      %��ֵ���ô�
                    % ���ж�һ�Σ���Ϊģ������ֻ��һ���ļ�
  d = disteu(v, code{1});    %����õ�ģ���Ҫ�жϵ�����֮��ġ����롱
  dist = sum(min(d,[],2)) / size(d,1);  %�任�õ�һ���������
        
  %������ֵ������
  msgc = sprintf('��ģ�������źŵĲ�ֵΪ:%10f ', dist);
  disp(msgc); 
  %����ƥ��  

  if dist <= distmin  %һ����ֵ��С����ֵ�����������ˡ�
     msg = sprintf('��%dλ˵������ģ�������ź�ƥ��,����Ҫ��!\n', k);           
     finalmsg = '��λ˵���߷���Ҫ��!'; %������ʾ��䣬�������趨        
     disp(msg);       
  end                 
  %���˲�ƥ��  

  if dist > distmin                          
    msg = sprintf('��%dλ˵������ģ�������źŲ�ƥ��,������Ҫ��!\n', k);
    finalmsg = '��λ˵���߲�����Ҫ��!'; %������ʾ��䣬�������趨
    disp(msg);      
  end        
end
