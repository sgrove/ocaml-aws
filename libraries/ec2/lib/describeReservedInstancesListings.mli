open Types
type input = DescribeReservedInstancesListingsRequest.t
type output = DescribeReservedInstancesListingsResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)