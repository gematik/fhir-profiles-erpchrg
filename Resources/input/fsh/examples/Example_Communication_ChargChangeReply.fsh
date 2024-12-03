Instance: Communication_ChargChangeReply
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReply
Title: "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
Usage: #example
* id = "3bbc2209-9c23-4553-986e-a5c9f69a39fb"
* meta.tag.display = "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
* basedOn.reference = "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8"
* status = #unknown
* insert PKV_Identifier(recipient.identifier)
* insert ApoTelematikID(sender.identifier)
* insert DateTimeStamp(sent)
* payload.contentString = "Erledigt."
