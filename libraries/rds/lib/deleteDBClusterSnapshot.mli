open Types
type input = DeleteDBClusterSnapshotMessage.t
type output = DeleteDBClusterSnapshotResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)