open Types
type input = ImportVolumeRequest.t
type output = ImportVolumeResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)