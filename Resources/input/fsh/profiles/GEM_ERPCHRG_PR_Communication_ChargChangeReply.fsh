Profile: GEM_ERPCHRG_PR_Communication_ChargChangeReply
Parent: Communication
Id: GEM-ERPCHRG-PR-Communication-ChargChangeReply
Title: "Reply on change Request on ChargeItem from pharmacy to Patient"
Description: "Ressource used for the communication to reply to a change request on a ChargeItem"
* insert Meta(GEM_ERPCHRG_PR_Communication_ChargChangeReply)
* ^abstract = true
* insert MetaProfile(GEM_ERPCHRG_PR_Communication_ChargChangeReply)
* basedOn 1..1
* basedOn only Reference(GEM_ERPCHRG_PR_ChargeItem)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1..1
* status = #unknown (exactly)
* sent MS
* received MS
* recipient 1..1
* recipient.identifier 1..1
* recipient.identifier only $identifier-pkv or $identifier-kvid-10
* recipient.identifier.assigner.display 0..1
* sender 1..1
* sender.identifier 1..1
* sender.identifier only IdentifierTelematikId
* payload 0..1
* payload.content[x] only string

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
* recipient[+].identifier.system = "http://fhir.de/sid/pkv/kvid-10"
* recipient[=].identifier.value = "X234567890"
* sent = "2022-07-04T13:46:30.128+02:00"
* payload.contentString = "Erledigt."