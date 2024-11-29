Profile: GEM_ERPCHRG_PR_Consent
Parent: Consent
Id: GEM-ERPCHRG-PR-Consent
* insert Meta(GEM_ERPCHRG_PR_Consent)
* insert MetaProfile(GEM_ERPCHRG_PR_Consent)

* status = #active (exactly)
* scope.coding 1..1
  * system = $cs-consent-scope (exactly)
  * code = #patient-privacy (exactly)
  * display = "Privacy Consent" (exactly)

* category 1..1
* category from GEM_ERPCHRG_VS_ConsentType (required)
* patient 1..1
  * identifier 1..1
  * identifier only IdentifierKvid10
    * assigner MS
    * assigner.identifier MS
    * assigner.identifier only IdentifierIknr
* dateTime 1..1

* policyRule MS
* policyRule from v3-ActCode