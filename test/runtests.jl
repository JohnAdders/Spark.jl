using Spark
using Base.Test

test_master = get(ENV, "SPARKJL_TESTMASTER", "local")
sc = SparkContext(master = test_master)

include("basic.jl")
include("map.jl")
include("map_partitions.jl")
include("attach.jl")
include("reduce.jl")
include("text_file.jl")
include("share_variable.jl")
include("flat_map.jl")
include("cartesian.jl")
include("group_by_key.jl")
include("reduce_by_key.jl")
include("collect_pair.jl")
include("map_pair.jl")
include("repartition_coalesce.jl")
include("filter.jl")
include("pipe.jl")
# S3 reading does not work on build server, it is executed only for yarn
if (test_master == "yarn")
  include("text_file_s3.jl")
end

close(sc)
