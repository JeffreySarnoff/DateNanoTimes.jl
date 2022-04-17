for period in (:Year, :Quarter, :Month, :Week, :Day)
    accessor = Symbol(lowercase(string(period)))
    @eval begin
        Dates.$accessor(td::DateNanoTime) = $accessor(td.date)
        Dates.$period(td::DateNanoTime) = $period($accessor(td.date))
    end
end

for period in (:Hour, :Minute, :Second, :Millisecond, :Microsecond, :Nanosecond)
    accessor = Symbol(lowercase(string(period)))
    @eval begin
        Dates.$accessor(td::DateNanoTime) = $accessor(td.time)
        Dates.$period(td::DateNanoTime) = $period($accessor(td.time))
    end
end
