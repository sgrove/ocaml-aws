open Types
type input = CreateKeyPairRequest.t
type output = KeyPair.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)