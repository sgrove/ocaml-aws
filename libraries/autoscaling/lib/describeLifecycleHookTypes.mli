open Types
type input = Aws.BaseTypes.Unit.t
type output = DescribeLifecycleHookTypesAnswer.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)