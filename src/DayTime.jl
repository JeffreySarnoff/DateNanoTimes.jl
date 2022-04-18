struct DaysTime
    days::Int64
    time::Time
end

DaysTime(x::Time, y::Int) = DaysTime(y, x)
DaysTime(x::Time) = DaysTime(0, x)
DaysTime(x::Day) = DaysTime(value(x), Time0)
DaysTime(x::Day, y::Time) = DaysTime(value(x), y)
DaysTime(x::Time, y::Day) = DaysTime(value(y),  x)

Base.:(+)(x::DaysTime, y::Day) = DaysTime(x.days + value(y), x.time)
Base.:(+)(y::Day, y::DaysTime) = DaysTime(y.days + value(x), y.time)
Base.:(-)(x::DaysTime, y::Day) = DaysTime(x.days - value(y), x.time)

Dates.CompoundPeriod(x::DaysTime) =
    Day(x.days) + Dates.CompoundPeriod(x.time)
Dates.CompoundPeriod(x::Time) =
    Nanosecond(x) + Microsecond(x) + Millisecond(x) + Second(x) + Minute(x) + Hour(x)

function DaysTime(x::Dates.CompoudPeriod)
    days = Day(x

function Dates.Day(x::Dates.CompoundPeriod)
    idx = map(x->isa(x, Day), x)
        
function typesof(x::Dates.CompoundPeriod)
     typeofs = map(typeof, x.periods)
     syms = Symbol.(typeofs)
     types = fill(Period, length(syms))
     NamedTuple{(syms...), NTuple{Period, length(syms)}}
 end
        
Base.:(+)(x::DaysTime, y::CompoundPeriod) = DaysTime(CompoundPeriod(x) + y)
Base.:(+)(x::CompoundPeriod, y::DaysTime) = y + x
Base.:(-)(x::DaysTime, y::CompoundPeriod) = DaysTime(CompoundPeriod(x) - y)

ntargs(x::CompoundPeriod) = ntargs(x.periods)
        
function ntargs(x::Vector{Period})
    syms = Tuple(map(x->Symbol(typeof(x)), x))
    t = Tuple(typeof.(x))
    typs = Tuple{t...}
    NamedTuple{syms, typs}
end
