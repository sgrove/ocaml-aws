open Types
type input = DownloadDBLogFilePortionMessage.t
type output = DownloadDBLogFilePortionDetails.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)