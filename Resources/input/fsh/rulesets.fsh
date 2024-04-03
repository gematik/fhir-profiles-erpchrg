// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #draft
* ^version = "1.0"

RuleSet: Meta (profileName)
* insert Versioning
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpchrg/StructureDefinition/{profileName}"

RuleSet: MetaProfile (profileName)
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpchrg/StructureDefinition/{profileName}|1.0" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0

RuleSet: Meta-Inst
* insert Versioning
* experimental = false
* publisher = "gematik GmbH"