open Types
type input = ModifyVpcEndpointRequest.t
type output = ModifyVpcEndpointResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)