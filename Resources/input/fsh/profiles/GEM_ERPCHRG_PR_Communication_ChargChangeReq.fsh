Profile: GEM_ERPCHRG_PR_Communication_ChargChangeReq
Parent: Communication
Id: GEM-ERPCHRG-PR-Communication-ChargChangeReq
Title: "Request for Modification on ChargeItem"
Description: "Ressource used for the communication of Change Request on an existing ChargeItem between patient and pharmacy"
* insert Meta(GEM_ERPCHRG_PR_Communication_ChargChangeReq)
* ^abstract = true
* insert MetaProfile(GEM_ERPCHRG_PR_Communication_ChargChangeReq)
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq|1.0" (exactly)
* basedOn 1..1
* basedOn only Reference(GEM_ERPCHRG_PR_ChargeItem)
* basedOn ^type.aggregation = #referenced
* basedOn.reference 1..1
* status = #unknown (exactly)
* sent MS
* received MS
* recipient 1..1
* recipient.identifier 1..1
* recipient.identifier only IdentifierTelematikId
* sender MS
* sender.identifier 1..1
* sender.identifier only IdentifierKvid10 or KBV_PR_FOR_Identifier_PkvID_10
* payload 0..1
* payload.content[x] only string

