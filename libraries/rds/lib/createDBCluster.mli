open Types
type input = CreateDBClusterMessage.t
type output = CreateDBClusterResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)