open Types
type input = CreateReservedInstancesListingRequest.t
type output = CreateReservedInstancesListingResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)