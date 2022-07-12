Profile: GEM_ERPCHRG_PR_Consent
Parent: Consent
Id: GEM-ERPCHRG-PR-Consent
* ^url = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Consent"
* ^version = "1.0"
* ^status = #draft
* status = #active (exactly)
* scope.coding.system = "http://terminology.hl7.org/CodeSystem/consentscope" (exactly)
* scope.coding.code = #patient-privacy (exactly)
* scope.coding.display = "Privacy Consent" (exactly)
* category 1..1
* category from GEM_ERPCHRG_VS_ConsentType (extensible)
* patient 1..
* patient.identifier 1..1
* patient.identifier only IdentifierPkv or IdentifierKvid10
* patient.identifier.assigner.display 0..1
* dateTime 1..
* policyRule MS
* policyRule from http://terminology.hl7.org/ValueSet/v3-ActCode



Instance: ChargeItemConsent
InstanceOf: GEM_ERPCHRG_PR_Consent
Title:   "Consent to store digital ChargeItem"
Usage: #example
* id = "0dcc5d4c-bf24-4c06-b02e-be5bc24587e2"
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"
* category = https://gematik.de/fhir/erpchrg/CodeSystem/ConsentType#CHARGCONS "Saving electronic charge item."
* patient[+].identifier.type.coding[+].system = "http://fhir.de/CodeSystem/identifier-type-de-basis"
* patient[=].identifier.type.coding[=].code = #PKV
* patient[=].identifier.system = "http://fhir.de/sid/pkv/kvid-10"
* patient[=].identifier.value = "X234567890"
* patient[=].identifier.assigner.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* patient[=].identifier.assigner.identifier.value = "168140950"
* dateTime = "2021-06-01T07:13:00+05:00"
* policyRule = http://terminology.hl7.org/CodeSystem/v3-ActCode#OPTIN