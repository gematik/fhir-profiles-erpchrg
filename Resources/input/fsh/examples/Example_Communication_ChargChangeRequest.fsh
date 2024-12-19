Instance: Communication_ChargChangeRequest
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReq
Title: "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
Usage: #example
* id = "b4cf7f71-3ade-40ab-97a9-929f95af29f2"
* meta.tag.display = "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
* basedOn.reference = "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* insert PKV_Identifier(sender.identifier)
* insert ApoTelematikID(recipient.identifier)
* insert DateTimeStamp(sent)
* payload.contentString = "Bitte meinen Namen in Günther ändern, Waltraud ist falsch."