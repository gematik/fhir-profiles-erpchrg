/* TODO: Merge approved datetime branch into this branch and build
Instance: ChargeItemConsent-Request
InstanceOf: GEM_ERPCHRG_PR_Consent
Title:   "Consent to store digital ChargeItem"
Usage: #example
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"
* category = GEM_ERPCHRG_CS_ConsentType#CHARGCONS "Consent for saving electronic charge item"
* patient.identifier.system = $identifier-kvid-10
* patient.identifier.value = "X234567890"
* patient.identifier.assigner.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* patient.identifier.assigner.identifier.value = "168140950"
* policyRule = http://terminology.hl7.org/CodeSystem/v3-ActCode#OPTIN
*/

Instance: ChargeItemConsent-Response
InstanceOf: GEM_ERPCHRG_PR_Consent
Title:   "Consent to store digital ChargeItem"
Usage: #example
* id = "0dcc5d4c-bf24-4c06-b02e-be5bc24587e2"
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"
* category = GEM_ERPCHRG_CS_ConsentType#CHARGCONS "Consent for saving electronic charge item"
* patient.identifier.system = $identifier-kvid-10
* patient.identifier.value = "X234567890"
* patient.identifier.assigner.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* patient.identifier.assigner.identifier.value = "168140950"
* insert DateTimeStamp(dateTime)
* policyRule = http://terminology.hl7.org/CodeSystem/v3-ActCode#OPTIN