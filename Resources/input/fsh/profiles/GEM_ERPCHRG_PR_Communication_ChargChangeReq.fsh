Profile: GEM_ERPCHRG_PR_Communication_ChargChangeReq
Parent: Communication
Id: GEM-ERPCHRG-PR-Communication-ChargChangeReq
Title: "Request for Modification on ChargeItem"
Description: "Ressource used for the communication of Change Request on an existing ChargeItem between patient and pharmacy"
* insert MetaProfile(GEM_ERPCHRG_PR_Communication_ChargChangeReq)
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
* sender.identifier only IdentifierKvid10
* payload 0..1
* payload.content[x] only string

