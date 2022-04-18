const DateGrains = Tuple(Symbol.(subtypes(DatePeriod)))
const TimeGrains = Tuple(Symbol.(subtypes(TimePeriod)))
const DateTimeGrains = (TimeGrains[3:end]..., DateGrains...)
const TimeAndDayGrains = (TimeGrains..., :Day)
const TimeAndDateGrains = (TimeGrains..., DateGrains...)

const DateValues = Symbol.(lowercase.(String.(DateGrains)))
const TimeValues = Symbol.(lowercase.(String.(TimeGrains)))
const DateTimeValues = Symbol.(lowercase.(String.(DateTimeGrains)))
const TimeAndDayValues = Symbol.(lowercase.(String.(TimeAndDayGrains)))
const TimeAndDateValues = Symbol.(lowercase.(String.(TimeAndDateGrains)))

const DateGrainsDays = Symbol.(String.(DateGrains) .* 's')
const TimeGrainsNanoseconds = Symbol.(String.(TimeGrains) .* 's')
const DateTimeGrainsMilliseconds = Symbol.(String.(DateTimeGrains) .* 's')
const TimeAndDayGrainsNanoseconds = Symbol.(String.(TimeAndDayGrains) .* 's')
const TimeAndDateGrainsNanoseconds = Symbol.(String.(TimeAndDateGrains) .* 's')

const DateValuesDays = Symbol.(String.(DateValues) .* 's')
const TimeValuesNanoseconds = Symbol.(String.(TimeValues) .* 's')
const DateTimeValuesMilliseconds = Symbol.(String.(DateTimeValues) .* 's')
const TimeAndDayValuesNanoseconds = Symbol.(String.(TimeAndDayValues) .* 's')
const TimeAndDateValuesNanoseconds = Symbol.(String.(TimeAndDateValues) .* 's')

(:Nanosecond, :Microsecond, :Millisecond,:Second, :Minute: :Hour)
const DateTimeGrains = (:Millisecond, :Second, :Minute: :Hour, :Day, :Week, :Month, :Quarter, :Year)
const DayTimeGrains = (:Nanosecond, :Microsecond, :Millisecond, :Second, :Minute: :Hour, :Day)

const TimeGrainValues = Symbol.(lowercase.(String.(TimeGrains))))
const DateGrainValues = Symbol.(lowercase.(String.(DateGrains))))
const DateTimeGrainValues = Symbol.(lowercase.(String.(DateGrains))))

(:day, :week, :month, :quarter, :year)
const TimeGrainValues = (:nanosecond, :microsecond, :millisecond,:second, :minute: :hour)
const DateTimeGrainValues = (:millisecond, :second, :minute: :hour, :day, :week, :month, :quarter, :year)
const DayTimeGrainValues = (:nanosecond, :microsecond, :millisecond, :second, :minute: :hour, :day)

const Time0 = Time(0)
const Date0 = Date(0)
const Rata0 = Date(rata2datetime(0))
  
# each epoch (at Time0) as a DateTime
const RATAasDateTime = rata2datetime(0)
const UNIXasDateTime = unix2datetime(0)
const DATE0asDateTime = DateTime(Date0)

# each epoch (at Time0) as a Date
const RATAasDate = Date(RATAasDateTime)
const UNIXasDate = Date(UNIXasDateTime)
const DATE0asDate = Date0

# epochs to/from Rata Die
const UNIXasRATA = datetime2rata(UNIXasDateTime)
const DATE0asRATA = datetime2rata(DATE0asDateTime)
const UNIXtoRATA = -UNIXasRATA
const DATE0toRATA = -DATE0asRATA

# Period Conversions

const QuartersPerYear = Int64(4)
const MonthsPerQuarter = Int64(3)
const MonthsPerYear = Int64(12)

const DaysPerWeek = Int64(7)
const HoursPerDay = Int64(24)
const MinutesPerHour = Int64(60)
const SecondsPerMinute = Int64(60)
const MillisecondsPerSecond = Int64(1_000)
const MicrosecondsPerMillisecond = Int64(1_000)
const NanosecondsPerMicrosecond = Int64(1_000)

const MinutesPerDay = HoursPerDay * MinutesPerHour
const MinutesPerWeek = MinutesPerDay * DaysPerWeek

const SecondsPerHour = MinutesPerHour * SecondsPerMinute
const SecondsPerDay = HoursPerDay * SecondsPerHour
const SecondsPerWeek = SecondsPerDay * DaysPerWeek

const MillisecondsPerMinute = SecondsPerMinute * MillisecondsPerSecond
const MillisecondsPerHour = MinutesPerHour * MillisecondsPerMinute
const MillisecondsPerDay = HoursPerDay * MillisecondsPerHour
const MillisecondsPerWeek = MillisecondsPerDay * DaysPerWeek

const MicrosecondsPerSecond = MillisecondsPerSecond * MicrosecondsPerMillisecond
const MicrosecondsPerMinute = SecondsPerMinute * MillisecondsPerSecond
const MicrosecondsPerHour = MinutesPerHour * MillisecondsPerMinute
const MicrosecondsPerDay = HoursPerDay * MillisecondsPerHour
const MicrosecondsPerWeek = MicrosecondsPerDay * DaysPerWeek

const NanosecondsPerMillisecond = MicrosecondsPerMillisecond * NanosecondsPerMicrosecond
const NanosecondsPerSecond = MillisecondsPerSecond * NanosecondsPerMillisecond
const NanosecondsPerMinute = SecondsPerMinute * NanosecondsPerSecond
const NanosecondsPerHour = MinutesPerHour * NanosecondsPerMinute
const NanosecondsPerDay = HoursPerDay * NanosecondsPerHour
const NanoosecondsPerWeek = NanosecondsPerDay * DaysPerWeek

# average values

const GregorianCycleDays = 146_097 # excactly days in 400 years from 1600, 2000 ..
const GregorianCycleWeeks = 20_871 # exactly
const GregorianCycleYears = 400
const GregorianCycleQuarters = GregorianCycleYears * QuartersPerYear
const GregorianCycleMonths = GregorianCycleYears * MonthsPerYear

const AvgDaysPerYear = GregorianCycle / GregorianCycleYears
const AvgDaysPerQuarter = GregorianCycle / GregorianCycleQuarter
const AvgDaysPerMonth = GregorianCycle / GregorianCycleMonths
const AvgDaysPerWeek = GregorianCycle / GregorianCycleWeeks

const AvgHoursPerYear = AvgDaysPerYear * HoursPerDay
const AvgHoursPerQuarter = AvgDaysPerQuarter * HoursPerDay
const AvgHoursPerMonth = AvgDaysPerMonth * HoursPerDay
const AvgHoursPerWeek = HoursPerWeek
const AvgHoursPerDay = HoursPerDay

const AvgMinutesPerYear = AvgDaysPerYear * MinutesPerDay
const AvgMinutesPerQuarter = AvgDaysPerQuarter * MinutesPerDay
const AvgMinutesPerMonth = AvgDaysPerMonth * MinutesPerDay
const AvgMinutesPerWeek = MinutesPerWeek
const AvgMinutesPerDay = MinutesPerDay

const AvgSecondsPerYear = AvgDaysPerYear * SecondsPerDay
const AvgSecondsPerQuarter = AvgDaysPerQuarter * SecondsPerDay
const AvgSecondsPerMonth = AvgDaysPerMonth * SecondsPerDay
const AvgSecondsPerWeek = SecondsPerWeek
const AvgSecondsPerDay = SecondsPerDay

const AvgMillisecondsPerYear = AvgDaysPerYear * MillisecondsPerDay
const AvgMillisecondsPerQuarter = AvgDaysPerQuarter * MillisecondsPerDay
const AvgMillisecondsPerMonth = AvgDaysPerMonth * MillisecondsPerDay
const AvgMillisecondsPerWeek = MillisecondsPerWeek
const AvgMillisecondsPerDay = MillisecondsPerDay

const AvgMicrosecondsPerYear = AvgDaysPerYear * MicrosecondsPerDay
const AvgMicrosecondsPerQuarter = AvgDaysPerQuarter * MicrosecondsPerDay
const AvgMicrosecondsPerMonth = AvgDaysPerMonth * MicrosecondsPerDay
const AvgMicrosecondsPerWeek = MicrosecondsPerWeek
const AvgMicrosecondsPerDay = MicrosecondsPerDay

const AvgNanosecondsPerYear = AvgDaysPerYear * NanosecondsPerDay
const AvgNanosecondsPerQuarter = AvgDaysPerQuarter * NanosecondsPerDay
const AvgNanosecondsPerMonth = AvgDaysPerMonth * NanosecondsPerDay
const AvgNanosecondsPerWeek = NanosecondsPerWeek
const AvgNanosecondsPerDay = NanosecondsPerDay




const AvgHoursPerYear = AvgDaysPerYear * HoursPerDay
const AvgHoursPerQuarter = AvgDaysPerQuarter * HoursPerDay
const AvgHoursPerMonth = AvgDaysPerMonth * HoursPerDay
const AvgHoursPerWeek = HoursPerWeek
const AvgHoursPerDay = HoursPerDay



