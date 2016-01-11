open Types
type input = AddTagsToResourceMessage.t
type output = TagListMessage.t
type error = Errors.t
include
  (Aws.Call with type  input :=  input and type  output :=  output and type
     error :=  error)