Extension: GEM_ERPCHRG_EX_MarkingFlag
Id: GEM-ERPCHRG-EX-MarkingFlag
* ^url = $GEM_ERPCHRG_EX_MarkingFlag_URL
* ^version = "1.0"
* ^status = #draft
* ^context.type = #element
* ^context.expression = "ChargeItem"
* . ^short = "Options for submitted ChargeItem"
* . ^definition = "Optional Extension for ChargeItem-Ressources in eRx workflow"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension contains
    insuranceProvider 1..1 and
    subsidy 1..1 and
    taxOffice 1..1
* extension[insuranceProvider] ^short = "submitted to health insurance provider"
* extension[insuranceProvider] ^definition = "Patient submitted their ChargeItem to his health insurance provider."
* extension[insuranceProvider].value[x] only boolean
* extension[insuranceProvider].value[x] ^slicing.discriminator.type = #type
* extension[insuranceProvider].value[x] ^slicing.discriminator.path = "$this"
* extension[insuranceProvider].value[x] ^slicing.rules = #closed
* extension[insuranceProvider].valueBoolean only boolean
* extension[insuranceProvider].value[x] ^short = "true = submitted to insurance provider"

* extension[subsidy] ^short = "submitted to aid organization ('Beihilfe')"
* extension[subsidy] ^definition = "Patient submitted their ChargeItem to the aid organization ('Beihilfe')."
* extension[subsidy].value[x] only boolean
* extension[subsidy].value[x] ^slicing.discriminator.type = #type
* extension[subsidy].value[x] ^slicing.discriminator.path = "$this"
* extension[subsidy].value[x] ^slicing.rules = #closed
* extension[subsidy].valueBoolean only boolean
* extension[subsidy].value[x] ^short = "true = submitted to aid organization"

* extension[taxOffice] ^short = "submitted to tax office"
* extension[taxOffice] ^definition = "Patient submitted their ChargeItem to the tax office."
* extension[taxOffice].value[x] only boolean
* extension[taxOffice].value[x] ^slicing.discriminator.type = #type
* extension[taxOffice].value[x] ^slicing.discriminator.path = "$this"
* extension[taxOffice].value[x] ^slicing.rules = #closed
* extension[taxOffice].valueBoolean only boolean
* extension[taxOffice].value[x] ^short = "true = submitted to tax office"