Instance: Communication_ChargChangeReply_Gkv
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReply
Title: "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
Usage: #example
* id = "3bbc2209-9c23-4553-986e-a5c9f69a39fb"
* meta.profile[+] = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReply|1.0"
* meta.tag.display = "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
* basedOn.reference = "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8"
* status = #unknown
* sender.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* sender.identifier.value = "3-SMC-B-Testkarte-883110000123465"
* recipient[+].identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* recipient[=].identifier.value = "X234567890"
* sent = "2022-04-29T13:46:30.128+02:00"
* payload.contentString = "Erledigt."

Instance: Communication_ChargChangeReply_Pkv
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReply
Title: "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
Usage: #example
* id = "7bbc2209-9c23-4553-986e-a5c9f69a39fp"
* meta.profile[+] = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReply|1.0"
* meta.tag.display = "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
* basedOn.reference = "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90ap"
* status = #unknown
* sender.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* sender.identifier.value = "3-SMC-B-Testkarte-883110000123465"
* recipient[+].identifier.system = $identifier-kvid-10
* recipient[=].identifier.value = "X234567890"
* sent = "2022-07-04T13:46:30.128+02:00"
* payload.contentString = "Erledigt."