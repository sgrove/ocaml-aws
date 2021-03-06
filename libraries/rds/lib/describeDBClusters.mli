open Types
type input = DescribeDBClustersMessage.t
type output = DBClusterMessage.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)