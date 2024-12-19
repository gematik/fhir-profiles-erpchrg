// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #draft
* ^version = "1.1"

RuleSet: Meta (profileName)
* insert Versioning
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpchrg/StructureDefinition/{profileName}"

RuleSet: MetaProfile(profileName)
* meta 1..1
* meta.profile 1..1
* meta.profile = "https://gematik.de/fhir/erpchrg/StructureDefinition/{profileName}|1.1" (exactly)
* meta.versionId 0..0
* meta.source 0..0
* meta.security 0..0

RuleSet: Meta-Inst
* insert Versioning
* experimental = false
* publisher = "gematik GmbH"

RuleSet: CodeSystem(name)
* ^url = "https://gematik.de/fhir/erpchrg/CodeSystem/{name}"
* insert Versioning
* ^publisher = "gematik GmbH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"
* ^copyright = "gematik GmbH"
* ^caseSensitive = true

RuleSet: ValueSet(name)
* ^url = "https://gematik.de/fhir/erpchrg/ValueSet/{name}"
* insert Versioning
* ^publisher = "gematik GmbH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.gematik.de"

// Dates for Examples (Date of actual release)
RuleSet: Date(field)
* {field} = "2025-10-01"

RuleSet: DateTime(field)
* {field} = "2025-10-01T15:29:00+00:00"

RuleSet: DateTimeStamp(field)
* {field} = "2025-10-01T15:29:00.434+00:00"