% Calculate the number of days in a year
function dayNum = calculateNumofDay(year, month, day)
dayNum = 0;
mon = [31,28,31,30,31,30,31,31,30,31,30,31];
for i = 1:month - 1
    dayNum = dayNum + mon(i);
end
dayNum = dayNum + day;
Leapyear = judgeLeapYear(year);
if Leapyear == 1
    if month >= 3
        dayNum = dayNum + 1;
    end
end