open Types
type input = DescribeInstanceAttributeRequest.t
type output = InstanceAttribute.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)