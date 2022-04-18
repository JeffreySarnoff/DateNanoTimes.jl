rata2date(x::Int) = Date(yearmonthday(x)...)
rata2date(x::Day) = rata2date(value(x))
  
date2rata(x::Date) = value(x)
