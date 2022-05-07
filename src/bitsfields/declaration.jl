#=
    DatePeriods and TimePeriods are as fields for integer values.
    When used this way, each has a predetermined maximum value.
    During a day, no matter what the time, there will have
    elapsed no more than 23 hours .. the transition into
    the 24th hour carries one to first hour of the following day.


=#

# how many bits does the value of this `int`?
nbits(int::Integer) = ndigits(int, base=2)

#=
    Date|Time Periods may be either added to or subtracted from.
    Our perspective holds these acts to occur within identical
    (i.e. duration matched) periods.
    
    While adding additional minutes to those already present,
    or instead, removing some minutes from those already present,
    we will do something inviting.

    Both addition and subtraction are at play, and we want
    the day to stay theirs. We give of our own focus and
    allow other's adventures to brighten the shared time.
=#


