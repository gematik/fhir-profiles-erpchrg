Profile: GEM_ERPCHRG_PR_ChargeItem
Parent: ChargeItem
Id: GEM-ERPCHRG-PR-ChargeItem
* insert Meta (GEM_ERPCHRG_PR_ChargeItem)
* insert MetaProfile (GEM_ERPCHRG_PR_ChargeItem)
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension contains
    $GEM_ERPCHRG_EX_MarkingFlag_URL named markingFlag 0..1 MS
* extension[markingFlag] ^short = "Flag list whether submitted Abrechnungsinformationen for PKV, Taxes, Subsidy"
* extension[markingFlag].extension ^slicing.discriminator.type = #value
* extension[markingFlag].extension ^slicing.discriminator.path = "url"
* extension[markingFlag].extension ^slicing.rules = #closed
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.description = "The task ressource contains three identifier. The first one is the identifier for the ask representing one e-prescription. The other identifier are representing the patient as owner of the prescription. One is the \"Krankenversichertennummer\" which identify each patient by his health insurance company and the other is \"Institutionskennzeichen\"."
* identifier ^slicing.rules = #closed
* identifier contains
    PrescriptionID 1..1 and
    AccessCode 0..1
* identifier[PrescriptionID] ^short = "Prescription Identifier"
* identifier[PrescriptionID] ^definition = "The prescription identifier is the main identifier for all the ePrecscription related ressources and the whole prescription workflow. This identifier is genereted by the \"E-Rezept Fachdienst\" and must not be changed manually."
* identifier[PrescriptionID].system = $GEM_ERP_PR_PrescriptionId (exactly)
* identifier[PrescriptionID].system 1..1
* identifier[PrescriptionID].value 1..1
* identifier[AccessCode] ^short = "AccessCode Identifier"
* identifier[AccessCode] ^definition = "Generated by the \"E-Rezept Fachdienst\". This identifier grants access to others than the patient."
* identifier[AccessCode].system 1..1
* identifier[AccessCode].system = $GEM_ERP_PR_AccessCode (exactly)
* identifier[AccessCode].value 1..1

* status = #billable (exactly)
* code.coding.system = "http://terminology.hl7.org/CodeSystem/data-absent-reason" (exactly)
* code.coding.code = #not-applicable (exactly)
* subject.identifier 1..
* subject.identifier only $identifier-kvid-10 or $identifier-pkv
* subject.identifier.assigner.display 0..1
* enterer ^short = "Pharmacy that initially provided the Abgabedaten in ChargeItem"
* enterer.identifier 1..
* enterer.identifier only $identifier-telematik-id

* supportingInformation 0..3 MS
* supportingInformation ^slicing.discriminator.type = #value
* supportingInformation ^slicing.discriminator.path = "type"
* supportingInformation ^slicing.rules = #closed
* supportingInformation ^definition = "holds references to the 3 relevant documents [prescription, receipt, dispensationInformation]"
* supportingInformation contains
    prescriptionItem 0..1 and
    dispenseItem 0..1 and
    receipt 0..1

* supportingInformation[dispenseItem].type 1..1
* supportingInformation[receipt].type 1..1
* supportingInformation[prescriptionItem].type 1..1

* supportingInformation[dispenseItem].type = $DAV_PR_ERP_Abgabeinformationen (exactly)
* supportingInformation[receipt].type = $GEM_ERP_PR_Bundle (exactly)
* supportingInformation[prescriptionItem].type = $KBV_PR_ERP_Bundle (exactly)


Instance: ChargeItemExample
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Title:   "ChargeItem completed by Fachdienst"
Usage: #example
* id = "abc825bc-bc30-45f8-b109-1b343fff5c45"
* meta.profile[+] = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_ChargeItem|1.0"
* extension[GEM_ERPCHRG_EX_MarkingFlag].url = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_EX_MarkingFlag"
* extension[GEM_ERPCHRG_EX_MarkingFlag].extension[insuranceProvider].url = "insuranceProvider"
* extension[GEM_ERPCHRG_EX_MarkingFlag].extension[insuranceProvider].valueBoolean = false
* extension[GEM_ERPCHRG_EX_MarkingFlag].extension[subsidy].url = "subsidy"
* extension[GEM_ERPCHRG_EX_MarkingFlag].extension[subsidy].valueBoolean = false
* extension[GEM_ERPCHRG_EX_MarkingFlag].extension[taxOffice].url = "taxOffice"
* extension[GEM_ERPCHRG_EX_MarkingFlag].extension[taxOffice].valueBoolean = false
* identifier[PrescriptionID].system = $GEM_ERP_PR_PrescriptionId
* identifier[PrescriptionID].value = "160.123.456.789.123.58"
* identifier[AccessCode].system = $GEM_ERP_PR_AccessCode
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #billable
* code = http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* subject.identifier.system = "http://fhir.de/sid/pkv/kvid-10"
* subject.identifier.value = "X234567890"
* enterer.identifier.system = "https://gematik.de/fhir/sid/telematik-id" (exactly)
* enterer.identifier.value = "606358757"
* enteredDate = "2021-06-01T07:13:00+05:00"
* supportingInformation[prescriptionItem] = Reference(urn:uuid:0428d416-149e-48a4-977c-394887b3d85c) "E-Rezept"
* supportingInformation[dispenseItem] = Reference(72bd741c-7ad8-41d8-97c3-9aabbdd0f5b4) "Abgabedatensatz"
* supportingInformation[receipt] = Reference(160.123.456.789.123.58) "Quittung"
