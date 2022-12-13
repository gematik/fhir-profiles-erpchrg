RuleSet: Meta (profileName)
* ^status = #draft
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpchrg/StructureDefinition/{profileName}"
* ^version = "1.0"

RuleSet: MetaProfile (profileName)
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpchrg/StructureDefinition/{profileName}|1.0" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0

RuleSet: Meta-Inst
* status = #draft
* experimental = false
* version = "1.0"
* publisher = "gematik GmbH"