open Types
type input = DescribePlacementGroupsRequest.t
type output = DescribePlacementGroupsResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)