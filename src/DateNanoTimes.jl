module DateNanoTimes

export DateNanoTimes

using Dates

include("construction")
include("constants")

include("bitsfields/mythought.jl")
include("bitsfields/declaration.jl")

include("period_accessors.jl")

end # DateNanoTimes

