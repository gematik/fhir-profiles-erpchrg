<img align="right" width="250" height="47" src="./Resources/images/gematik_logo.png" /> <br />    
 
# Release Notes E-Rezept Patientenrechnung
 
## Release Patientenrechnung 1.1.0 (2025-02-28)

- `breaking-change` new meta.profile Version 1.1
- `breaking-change` new dependencies:
	- de.basisprofil.r4 1.5.2
- `breaking-change` new KVID Identifier from de.basisprofil.r4 (PKV Identifier is not allowed anymore)
- `breaking-change` GEM_ERPCHRG_PR_Consent.category now requires the use of GEM_ERPCHRG_VS_ConsentType
- `new profile` GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input for PATCH /ChargeItem
- `changed` fixed Slicing in ChargeItem

## Release Patientenrechnung 1.0.4 (2024-07-15)
- TC: Entfernen von unnötigen Slicings in GEM_ERPCHRG_EX_MarkingFlag
- Entfernen der Dependency zu de.gematik.erezept-workflow.r4