open Types
type input = ModifyEventSubscriptionMessage.t
type output = ModifyEventSubscriptionResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)