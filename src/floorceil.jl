#=
   Dates supports `floor` and `ceil` for Date and DateTime only.
   Here are `floor` and `ceil` for Time and DateNanoTime.
=#

for P in Symbol.(subtypes(TimePeriod))
  @eval begin
    Base.floor(x::Time, ::Type{$P}) = trunc(x, ::Type{$p})
    Base.ceil(x::Time, ::Type{$P}) = trunc(x, ::Type{$P}) + rollinto(x, $P)
  end
end

function Base.ciel(x::Time, ::Type{Hour})
    if hour(x) == 23 && rollinto(x, Hour)
        Day(1)
    else
        trunc(x, ::Type{$P})
    end
end

rollinto(x::Time, ::Type{Nanosecond}) = false
rollinto(x::Time, ::Type{Microsecond}) = nanosecond(x) >= 1_000 * 500 
rollinto(x::Time, ::Type{Millisecond}) = nanoseconds(x) >= 1_000 * 1_000 * 500
rollinto(x::Time, ::Type{Second}) = nanoseconds(x) >= 60 * 1_000 * 1_000 * 500
rollinto(x::Time, ::Type{Minute}) = nanoseconds(x) >= 60 * 60 * 1_000 * 1_000 * 500
rollinto(x::Time, ::Type{Hour}) = nanoseconds(x) >= 24 * 60 * 60 * 1_000 * 1_000 * 500


function nanoseconds(x::Time, ::Type{Week})
    deltadays = value(x - firstdayofweek(x))
    NanosecondsPerWeek * week(x) + NanosecondsPerDay * deltadays
end
nanoseconds(x::Time, ::Type{Day}) = 
    NanosecondsPerDay * day(x) + nanoseconds(x, Hour)
nanoseconds(x::Time, ::Type{Hour}) = 
    NanosecondsPerHour * hour(x) + nanoseconds(x, Minute)
nanoseconds(x::Time, ::Type{Minute}) = 
    NanosecondsPerMinute * minute(x) + nanoseconds(x, Second)
nanoseconds(x::Time, ::Type{Second}) = 
    NanosecondsPerSecond * second(x) + nanoseconds(x, Millisecond)
nanoseconds(x::Time, ::Type{Millisecond}) = 
    NanosecondsPerMillisecond * millisecond(x) + nanoseconds(x, Microsecond)
nanoseconds(x::Time, ::Type{Microsecond}) = 
    NanosecondsPerMicrosecond * microsecond(x) + nanosecond(x)
nanoseconds(x::Time, ::Type{Nanosecond}) = nanosecond(x)

for T in TimeAndDayGrains
  @eval Nanoseconds(x::Time, ::Type{$T}) = Nanosecond(nanoseconds(x, $T))
end

