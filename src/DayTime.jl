struct DaysTime
    days::Int64
    time::Time
end

DaysTime(x::Time, y::Int) = DaysTime(y, x)
DaysTime(x::Time) = DaysTime(0, x)
DaysTime(x::Day) = DaysTime(value(x), Time0)
DaysTime(x::Day, y::Time) = DaysTime(value(x), y)
DaysTime(x::Time, y::Day) = DaysTime(value(y),  x)


