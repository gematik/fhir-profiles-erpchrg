Instance: Communication_ChargChangeRequest_Gkv
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReq
Title: "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
Usage: #example
* id = "b4cf7f71-3ade-40ab-97a9-929f95af29f2"
* meta.profile[+] = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq|1.0"
* meta.tag.display = "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
* basedOn.reference = "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* sender.identifier.value = "X234567890"
* sent = "2020-04-29T13:43:30.128+02:00"
* payload.contentString = "Bitte meinen Namen in Günther ändern, Waltraud ist falsch."


Instance: Communication_ChargChangeRequest_Pkv
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReq
Title: "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
Usage: #example
* id = "b4cf7f71-3ade-40ab-97a9-929f95af29fp"
* meta.profile[+] = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq|1.0"
* meta.tag.display = "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
* basedOn.reference = "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* sent = "2020-07-04T13:43:30.128+02:00"
* payload.contentString = "Bitte meinen Namen in Günther ändern, Waltraud ist falsch."