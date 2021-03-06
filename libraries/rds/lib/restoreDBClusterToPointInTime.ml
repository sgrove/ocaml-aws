open Types
open Aws
type input = RestoreDBClusterToPointInTimeMessage.t
type output = RestoreDBClusterToPointInTimeResult.t
type error = Errors.t
let service = "rds"
let to_http req =
  let uri =
    Uri.add_query_params (Uri.of_string "https://rds.amazonaws.com")
      (List.append
         [("Version", ["2014-10-31"]);
         ("Action", ["RestoreDBClusterToPointInTime"])]
         (Util.drop_empty
            (Uri.query_of_encoded
               (Query.render
                  (RestoreDBClusterToPointInTimeMessage.to_query req))))) in
  (`POST, uri, [])
let of_http body =
  try
    let xml = Ezxmlm.from_string body in
    let resp =
      Util.option_bind
        (Xml.member "RestoreDBClusterToPointInTimeResponse" (snd xml))
        (Xml.member "RestoreDBClusterToPointInTimeResult") in
    try
      Util.or_error
        (Util.option_bind resp RestoreDBClusterToPointInTimeResult.parse)
        (let open Error in
           BadResponse
             {
               body;
               message =
                 "Could not find well formed RestoreDBClusterToPointInTimeResult."
             })
    with
    | Xml.RequiredFieldMissing msg ->
        let open Error in
          `Error
            (BadResponse
               {
                 body;
                 message =
                   ("Error parsing RestoreDBClusterToPointInTimeResult - missing field in body or children: "
                      ^ msg)
               })
  with
  | Failure msg ->
      `Error
        (let open Error in
           BadResponse { body; message = ("Error parsing xml: " ^ msg) })
let parse_error code err =
  let errors =
    [Errors.OptionGroupNotFoundFault;
    Errors.InvalidSubnet;
    Errors.DBSubnetGroupNotFoundFault;
    Errors.InvalidRestoreFault;
    Errors.InvalidVPCNetworkStateFault;
    Errors.StorageQuotaExceeded;
    Errors.InvalidDBClusterSnapshotStateFault;
    Errors.InvalidDBSnapshotState;
    Errors.InsufficientDBClusterCapacityFault;
    Errors.DBClusterSnapshotNotFoundFault;
    Errors.DBClusterNotFoundFault;
    Errors.DBSubnetGroupNotFoundFault;
    Errors.StorageQuotaExceeded;
    Errors.DBClusterQuotaExceededFault;
    Errors.DBClusterAlreadyExistsFault] @ Errors.common in
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