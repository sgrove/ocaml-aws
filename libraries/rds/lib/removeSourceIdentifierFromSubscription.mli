open Types
type input = RemoveSourceIdentifierFromSubscriptionMessage.t
type output = RemoveSourceIdentifierFromSubscriptionResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)