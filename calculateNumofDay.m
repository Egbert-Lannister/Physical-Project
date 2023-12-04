% Calculate the number of days in a year
function date = calculateNumofDay(year)
date = 0;
mon = [31,28,31,30,31,30,31,31,30,31,30,31];
for i = 1:month - 1
    date = date + mon(i);
end
date = date + day;
Leapyear = judgeLeapYear(year);
if Leapyear == 1
    if month >= 3
        date = date + 1;
    end
end