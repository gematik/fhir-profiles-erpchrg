### Version 1.1.0 (2025-04-10)
- `breaking-change` new meta.profile Version 1.1
- `breaking-change` new dependencies:
	- de.basisprofil.r4 1.5.2
- `breaking-change` new KVID Identifier from de.basisprofil.r4 (PKV Identifier is not allowed anymore)
- `breaking-change` GEM_ERPCHRG_PR_Consent.category now requires the use of GEM_ERPCHRG_VS_ConsentType
- `new profile` GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input for PATCH /ChargeItem
- `changed` fixed Slicing in ChargeItem
- `changed` fixed name in package.json

#### Anforderungen

Neue Anforderungen wurden hinzugefügt, bestehende geändert und nicht mehr benötigte gelöscht. Die folgenden Release Notes geben einen detaillierten Überblick über alle Anpassungen.

{% include release-notes.html version="1.1.0" with_links=true %}

