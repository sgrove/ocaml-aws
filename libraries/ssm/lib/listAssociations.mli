open Types
type input = ListAssociationsRequest.t
type output = ListAssociationsResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)