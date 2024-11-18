Profile: GEM_ERPCHRG_PR_Consent
Parent: Consent
Id: GEM-ERPCHRG-PR-Consent
* insert Meta(GEM_ERPCHRG_PR_Consent)
* insert MetaProfile(GEM_ERPCHRG_PR_Consent)
* status = #active (exactly)
* scope.coding.system = "http://terminology.hl7.org/CodeSystem/consentscope" (exactly)
* scope.coding.code = #patient-privacy (exactly)
* scope.coding.display = "Privacy Consent" (exactly)
* category 1..1
* category from GEM_ERPCHRG_VS_ConsentType (extensible)
* patient 1..
* patient.identifier 1..1
* patient.identifier only IdentifierKvid10
* patient.identifier.assigner.display 0..1
* dateTime 1..
* policyRule MS
* policyRule from http://terminology.hl7.org/ValueSet/v3-ActCode