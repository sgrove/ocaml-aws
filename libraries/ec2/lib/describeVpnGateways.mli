open Types
type input = DescribeVpnGatewaysRequest.t
type output = DescribeVpnGatewaysResult.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)