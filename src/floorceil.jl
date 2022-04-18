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

rollinto(x::Time, ::Type{Nanosecond}) = Nanosecond(0)
rollinto(x::Time, ::Type{Microsecond}) = nanosecond(x) >= 500
rollinto(x::Time, ::Type{Millisecond}) = nanosecond(x) >= 500

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

    Nanoseconds(x::Time, ::Type{Second)) = Nanosecond(nanoseconds(x, Second))
Nanoseconds(x::Time, ::Type(M)) = Nanosecond(nanoseconds(x, Second))
Nanoseconds(x::Time, ::Type{Second)) = Nanosecond(nanoseconds(x, Second))
Nanoseconds(x::Time, ::Type{Millisecond)) = Nanosecond(nanoseconds(x, Millisecond))
Nanoseconds(x::Time, ::Type{Microsecond)) = Nanosecond(nanoseconds(x, Millisecond))
Nanoseconds(x::Time, ::Type{Nanosecond)) = Nanosecond(nanoseconds(x))

Nanoseconds(x::Time, ::Type{Millisecond)) = Nanosecond(nanoseconds(x, Millisecond))

nanoseconds(x::Time, ::Type{Microsecond)) = 
    NanosecondsPerMicrosecond * microsecond(x) + nanosecond(x)

Nanoseconds(x::Time, ::Type{Microsecond)) = Nanosecond(nanoseconds(x, Microsecond))

for (P,p) in ((M
