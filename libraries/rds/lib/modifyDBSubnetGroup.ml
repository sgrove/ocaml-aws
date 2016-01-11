open Types
open Aws
type input = ModifyDBSubnetGroupMessage.t
type output = ModifyDBSubnetGroupResult.t
type error = Errors.t
let service = "rds"
let to_http req =
  let uri =
    Uri.add_query_params (Uri.of_string "https://rds.amazonaws.com")
      (List.append
         [("Version", ["2014-10-31"]); ("Action", ["ModifyDBSubnetGroup"])]
         (Util.drop_empty
            (Uri.query_of_encoded
               (Query.render (ModifyDBSubnetGroupMessage.to_query req))))) in
  (`POST, uri, [])
let of_http body =
  try
    let xml = Ezxmlm.from_string body in
    let resp =
      Util.option_bind (Xml.member "ModifyDBSubnetGroupResponse" (snd xml))
        (Xml.member "ModifyDBSubnetGroupResult") in
    try
      Util.or_error (Util.option_bind resp ModifyDBSubnetGroupResult.parse)
        (let open Error in
           BadResponse
             {
               body;
               message =
                 "Could not find well formed ModifyDBSubnetGroupResult."
             })
    with
    | Xml.RequiredFieldMissing msg ->
        let open Error in
          `Error
            (BadResponse
               {
                 body;
                 message =
                   ("Error parsing ModifyDBSubnetGroupResult - missing field in body or children: "
                      ^ msg)
               })
  with
  | Failure msg ->
      `Error
        (let open Error in
           BadResponse { body; message = ("Error parsing xml: " ^ msg) })
let parse_error code err =
  let errors =
    [Errors.InvalidSubnet;
    Errors.DBSubnetGroupDoesNotCoverEnoughAZs;
    Errors.SubnetAlreadyInUse;
    Errors.DBSubnetQuotaExceededFault;
    Errors.DBSubnetGroupNotFoundFault] @ Errors.common in
  match Errors.of_string err with
  | Some var ->
      if
        (List.mem var errors) &&
          ((match Errors.to_http_code var with
            | Some var -> var = code
            | None  -> true))
      then Some var
      else None
  | None  -> None