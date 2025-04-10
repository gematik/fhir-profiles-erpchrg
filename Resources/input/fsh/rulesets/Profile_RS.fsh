RuleSet: Meta (profileName)
* insert Versioning
* ^experimental = false
* ^publisher = "gematik GmbH"
* ^url = "https://gematik.de/fhir/erpchrg/StructureDefinition/{profileName}"

RuleSet: MetaProfile(profileName)
* insert Meta ({profileName})

* meta 1..1 MS
* meta.profile 1..1 MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #closed
  * ^slicing.description = "Slicing for meta profile"
  * ^slicing.ordered = false

* meta.profile contains erpchrgProfile 1..1 MS

* insert PackageMetaProfileExactly(StructureDefinition/{profileName})

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