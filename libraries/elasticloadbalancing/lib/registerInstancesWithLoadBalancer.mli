open Types
type input = RegisterEndPointsInput.t
type output = RegisterEndPointsOutput.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)