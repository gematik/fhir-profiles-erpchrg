Instance: ChargeItemConsent
InstanceOf: GEM_ERPCHRG_PR_Consent
Title:   "Consent to store digital ChargeItem"
Usage: #example
* id = "0dcc5d4c-bf24-4c06-b02e-be5bc24587e2"
* meta.profile = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Consent|1.0"
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"
* category = https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType#CHARGCONS "Consent for saving electronic charge item"
* patient[+].identifier.type.coding[+].system = "http://fhir.de/CodeSystem/identifier-type-de-basis"
* patient[=].identifier.type.coding[=].code = #KVZ10
* patient[=].identifier.system = $identifier-kvid-10
* patient[=].identifier.value = "X234567890"
* patient[=].identifier.assigner.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* patient[=].identifier.assigner.identifier.value = "168140950"
* dateTime = "2022-06-01T07:13:00+05:00"
* policyRule = http://terminology.hl7.org/CodeSystem/v3-ActCode#OPTIN