function Data = ReadDataI(path,str,txt)
% This function import the data from excel file
% The input is the file path
% The output is the data and if there exists text data it will be encoded
% as shown in the cell txt
% str is the index of text data in each row

[~,~,Data] = xlsread(path);
stridx = find(str);
nanidx = [];
for i=1:size(Data,1)
    for j=1:size(Data,2)
        if isnan(Data{i,j})
            nanidx = [nanidx;i j];
            if ismember(j,stridx)
                Data{i,j} = txt{1};
            else
                Data{i,j} = 0;
            end
        end
    end
end
% Encoding categories to numbers
for i=1:size(Data,1)
    for j=find(str)
        Data{i,j} = find(strcmp(txt,Data{i,j}));
    end
end
Data = cell2mat(Data);
nanidx = sub2ind(size(Data),nanidx(:,1),nanidx(:,2));
Data(nanidx) = NaN;




