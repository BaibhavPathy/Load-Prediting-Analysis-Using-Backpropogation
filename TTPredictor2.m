function [X, dates, labels] = TTPredictor1(data)
dates = datenum(data.Date);
if all(floor(dates)==dates) 
    dates = dates + (data.Minute)/60;
end
Holide  = datenum({'01-Jan-17','26-Jan-17'},'dd-mmm-yy');
prevDaySameHourLoad = [NaN(103,1); data.SYSLoad(1:end-103)];
prevWeekSameMinLoad = [NaN(721,1); data.SYSLoad(1:end-721)];
prev24HrAvgLoad = filter(ones(1,103)/103, 1, data.SYSLoad);
dayOfWeek = weekday(dates);
isWorkingDay = ~ismember(floor(dates),Holide) & ~ismember(dayOfWeek,[6 7]);
X = [data.Minute dayOfWeek isWorkingDay prevWeekSameMinLoad prevDaySameHourLoad prev24HrAvgLoad];
labels = {'Minute', 'Weekday', 'IsWorkingDay', 'PrevWeekSameMinLoad', 'prevDaySameHourLoad', 'prev24HrAvgLoad'};