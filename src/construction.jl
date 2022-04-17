struct DateNanoTime
    date::Date
    time::Time
end

date(x::DateNanoTime) = x.date
time(x::DateNanoTime) = x.time

DateNanoTime(x::DateNanoTime) = x

DateNanoTime(time::Time, date::Date) = DateNanoTime(date, time)

DateNanoTime(x::DateTime) = DateNanoTime(Date(x), Time(x))
DateNanoTime(x::Date) = DateNanoTime(x, Time0)
DateNanoTime(x::Time) = DateNanoTime(today(), Time0)

DateNanoTime(x::DateTime, us::Microsecond) = DateNanoTime(Date(x), Time(x) + ms) 
DateNanoTime(x::DateTime, ns::Nanosecond) = DateNanoTime(Date(x), Time(x) + ns) 
DateNanoTime(x::DateTime, us::Microsecond, ns::Nanosecond) =
    DateNanoTime(Date(x), Time(x) + Nanosecond((value(us) * NanosecondsPerMicrosecond) + value(ns)))

Date(x::DateNanoTime) = date(x)
Time(x::DateNanoTime) = time(x)
DateTime(x::DateNanoTime) = DateTime(date(x), trunc(time(x), Millisecond))
