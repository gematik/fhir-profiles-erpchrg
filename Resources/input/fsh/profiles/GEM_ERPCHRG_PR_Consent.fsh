Profile: GEM_ERPCHRG_PR_Consent
Parent: Consent
Id: GEM-ERPCHRG-PR-Consent
* insert MetaProfile(GEM_ERPCHRG_PR_Consent)

* status = #active (exactly)
* scope.coding 1..1 MS
  * system = $cs-consent-scope (exactly)
  * code = #patient-privacy (exactly)
  * display = "Privacy Consent" (exactly)

* category 1..1 MS
* category from GEM_ERPCHRG_VS_ConsentType (required)
* patient 1..1 MS
  * identifier 1..1 MS
  * identifier only IdentifierKvid10
    * assigner MS
    * assigner.identifier MS
    * assigner.identifier only IdentifierIknr
* dateTime MS
  * ^comment = "dateTime wird vom E-Rezept-Fachdienst zu dem Zeitpunkt gesetzt, an dem die Consent Ressource hochgeladen wird."


* policyRule MS
* policyRule from v3-ActCode