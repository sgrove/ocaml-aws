open Types
type input = PromoteReadReplicaMessage.t
type output = PromoteReadReplicaResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)