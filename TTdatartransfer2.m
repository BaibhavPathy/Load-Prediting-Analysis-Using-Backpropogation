[~, ~, raw, dates] = xlsread('C:\Users\BAIBHAV\Downloads\ANN gift\TT Load best\TTload.xlsx','Sheet1','B1:E1205','',@convertSpreadsheetExcelDates);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
raw = raw(:,[2,3,4]);
dates = dates(:,1);

R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); 
raw(R) = {NaN}; 
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),dates); 
dates(R) = {NaN}; 

data1 = reshape([raw{:}],size(raw));

data = table;

data.Date = datetime([dates{:,1}].', 'ConvertFrom', 'Excel');
data.Minute = data1(:,1);
data.SYSLoad = data1(:,2);
data.IsWorking = data1(:,3);
data.NumDate = datenum(data.Date);

clearvars data1 raw dates R;