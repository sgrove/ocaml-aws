open Types
type input = DescribeDBClusterParameterGroupsMessage.t
type output = DBClusterParameterGroupsMessage.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)