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
* recipient.identifier only $sd-identifier-kvid-10
* recipient.identifier.assigner.display 0..1
* sender 1..1
* sender.identifier 1..1
* sender.identifier only IdentifierTelematikId
* payload 0..1
* payload.content[x] only string