open Types
type input = CreateSubnetRequest.t
type output = CreateSubnetResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)