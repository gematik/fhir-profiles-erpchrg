// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #active
* ^version = "1.1.0"
* ^date = "2025-04-10"

// Rules to set meta.profile in profiles and instances
RuleSet: PackageMetaProfileExactly(profile)
* meta.profile[erpchrgProfile] = "https://gematik.de/fhir/erpchrg/{profile}|1.1" (exactly)

// Dates for Examples (Date of actual release)
RuleSet: Date(field)
* {field} = "2025-10-01"

RuleSet: DateTime(field)
* {field} = "2025-10-01T15:29:00+00:00"

RuleSet: DateTimeStamp(field)
* {field} = "2025-10-01T15:29:00.434+00:00"