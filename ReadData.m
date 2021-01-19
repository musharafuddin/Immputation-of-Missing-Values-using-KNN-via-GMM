function [Data,txt,str] = ReadData(path)
% This function import the data from excel file
% The input is the file path
% The output is the data and if there exists text data it will be encoded
% as shown in the cell txt

[~,~,Data] = xlsread(path);
%Get index for numerical columns
tmp = Data(1,:); 
str = false(1,length(tmp)); 
for i=1:length(tmp)
    if ischar(tmp{i})
       str(i) = true;
    end
end
% Encoding categories to numbers
txt = Data; txt(:,~str)=[];
txt = reshape(txt,[],1);
txt = unique(txt);
for i=1:size(Data,1)
    for j=find(str)
        Data{i,j} = find(strcmp(txt,Data{i,j}));
    end
end
Data = cell2mat(Data);





