open Types
type input = DescribeVolumeStatusRequest.t
type output = DescribeVolumeStatusResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)