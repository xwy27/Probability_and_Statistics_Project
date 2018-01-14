function preprocess(paths, filterZero, minLength)
% paths should be an array of paths of files
% result will contain no empty package if filterZero is true
% minLength indicate the minimal size of each sample
% format:
% preprocess({path1 path2 path3,..}, true or false, minLength)
a = parsepcap(paths, filterZero);
datas = values(a);
fid = fopen('midProduct.txt','wt');
for i=1:length(datas)
   temp = datas(i);
   if length(temp{1}) >= minLength
       fprintf(fid,'%g\n',length(temp{1}));
       fprintf(fid,'%g\n',temp{1});
       fprintf(fid,'\n');
   end
end
fclose(fid);