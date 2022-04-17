year(x::DateNanoTime) = year(date(x))
quarter(x::DateNanoTime) = value(Quarter(date(x)))
month(x::DateNanoTime) = month(date(x))
week(x::DateNanoTime) = week(date(x))
day(x::DateNanoTime) = day(date(x))

hour(x::DateNanoTime) = hour(time(x))
minute(x::DateNanoTime) = minute(time(x))
second(x::DateNanoTime) = second(time(x))
millisecond(x::DateNanoTime) = millisecond(time(x))
microsecond(x::DateNanoTime) = microsecond(time(x))
nanosecond(x::DateNanoTime) = nanosecond(time(x))

Year(x::DateNanoTime) = Year(year(x))
Quarter(x::DateNanoTime) = Quarter(date(x))
Month(x::DateNanoTime) = Month(month(x))
Week(x::DateNanoTime) = Week(week(x))
Day(x::DateNanoTime) = Day(day(x))

Hour(x::DateNanoTime) = Hour(hour(x))
Minute(x::DateNanoTime) = Minute(minute(x))
Second(x::DateNanoTime) = Second(second(x))
Millisecond(x::DateNanoTime) = Millisecond(millisecond(x))
Microsecond(x::DateNanoTime) = Microsecond(microsecond(x))
Nanosecond(x::DateNanoTime) = Nanosecond(nanosecond(x))

                                        
