open Types
type input = CreateInstanceExportTaskRequest.t
type output = CreateInstanceExportTaskResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)