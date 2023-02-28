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
* identifier[PrescriptionID].system = $GEM_ERP_NS_PrescriptionId (exactly)
* identifier[PrescriptionID].system 1..1
* identifier[PrescriptionID].value 1..1
* identifier[AccessCode] ^short = "AccessCode Identifier"
* identifier[AccessCode] ^definition = "Generated by the \"E-Rezept Fachdienst\". This identifier grants access to others than the patient."
* identifier[AccessCode].system 1..1
* identifier[AccessCode].system = $GEM_ERP_NS_AccessCode (exactly)
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

* supportingInformation 1..4 MS
* supportingInformation ^slicing.discriminator.type = #value
* supportingInformation ^slicing.discriminator.path = "display"
* supportingInformation ^slicing.rules = #closed
* supportingInformation ^definition = "holds references to the 3 relevant documents [prescription, receipt, dispensationInformation]"
* supportingInformation contains
    prescriptionItemBundle 0..1 and
    dispenseItemBinary 0..1 and
    dispenseItemBundle 0..1 and
    receiptBundle 0..1

* supportingInformation[dispenseItemBundle].display = $DAV-PKV-PR-ERP-AbgabedatenBundle (exactly)
* supportingInformation[dispenseItemBundle] only Reference(Bundle)

* supportingInformation[dispenseItemBinary].display = "Binary" (exactly)
* supportingInformation[dispenseItemBinary] only Reference(Binary)

* supportingInformation[receiptBundle].display = $GEM_ERP_PR_Bundle (exactly)
* supportingInformation[receiptBundle] only Reference(Bundle)

* supportingInformation[prescriptionItemBundle].display = $KBV_PR_ERP_Bundle (exactly)
* supportingInformation[prescriptionItemBundle] only Reference(Bundle)


Instance: DispenseItemBinaryExample
InstanceOf: Binary
Usage: #inline
* id = "c8720f99-6641-432d-94be-d49eaa164755"
* contentType = #application/pkcs7-mime
* data = "bWVycnkgY2hyaXN0bWFz"


Instance: ChargeItemExampleBundles
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Title:   "ChargeItem with Bundles completed by Fachdienst"
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
* identifier[PrescriptionID].system = $GEM_ERP_NS_PrescriptionId
* identifier[PrescriptionID].value = "160.123.456.789.123.58"
* identifier[AccessCode].system = $GEM_ERP_NS_AccessCode
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #billable
* code = http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* subject.identifier.system = "http://fhir.de/sid/pkv/kvid-10"
* subject.identifier.value = "X234567890"
* enterer.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* enterer.identifier.value = "3-15.2.1456789123.191"
* enteredDate = "2022-12-16T06:13:00+05:00"
* supportingInformation[dispenseItemBundle] = Reference(Bundle/72bd741c-7ad8-41d8-97c3-9aabbdd0f5b4)
* supportingInformation[dispenseItemBundle].display = $DAV-PKV-PR-ERP-AbgabedatenBundle
* supportingInformation[receiptBundle] = Reference(Bundle/160.123.456.789.123.58)
* supportingInformation[receiptBundle].display = $GEM_ERP_PR_Bundle
* supportingInformation[prescriptionItemBundle] = Reference(Bundle/0428d416-149e-48a4-977c-394887b3d85c)
* supportingInformation[prescriptionItemBundle].display = $KBV_PR_ERP_Bundle

Instance: ChargeItemExampleBinary
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Title:   "ChargeItem with contained Binary to Fachdienst"
Usage: #example
* meta.profile[+] = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_ChargeItem|1.0"
* contained[+] = DispenseItemBinaryExample
* identifier[PrescriptionID].system = $GEM_ERP_NS_PrescriptionId
* identifier[PrescriptionID].value = "160.123.456.789.123.58"
* identifier[AccessCode].system = $GEM_ERP_NS_AccessCode
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #billable
* code = http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* subject.identifier.system = "http://fhir.de/sid/pkv/kvid-10"
* subject.identifier.value = "X234567890"
* enterer.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* enterer.identifier.value = "3-15.2.1456789123.191"
* enteredDate = "2022-12-16T07:13:00+05:00"
* supportingInformation[dispenseItemBinary].reference = "#c8720f99-6641-432d-94be-d49eaa164755"
* supportingInformation[dispenseItemBinary].display = "Binary"

/*******************************************************/
/*

Dieser Block ist auskommentiert, da derzeit SUSHI noch einen Fehler enthält. Runde Dezimalwerte werden gerundet. Somit wird aus dem MwSteuersatz 19.00 -> 19
Die korrigierten Beispiele liegen unter /corrected_decimal_values_bundles
Falls Änderungen an den Beispielen geschehen sollen sind diese zu generieren -> korrigieren und dann in corrected_decimal_values_bundles zu kopieren.

Instance: Response_App_GETChargeItemById
InstanceOf: Bundle
Usage: #example
* id = "Response-App-GETChargeItemById"
* meta.lastUpdated = "2021-09-02T11:38:42.557+00:00"
* type = #searchset
* total = 4
* entry[0].fullUrl = "https://prescriptionserver.telematik/ChargeItem/abc825bc-bc30-45f8-b109-1b343fff5c45"
* entry[=].resource = App-ChargeItem-abc825bc-bc30-45f8-b109-1b343fff5c45
* entry[+].fullUrl = "https://prescriptionserver.telematik/Bundle/414ca393-dde3-4082-9a3b-3752e629e4aa"
* entry[=].resource = PrescriptionBundleExample
* entry[+].fullUrl = "https://prescriptionserver.telematik/Bundle/f548dde3-a319-486b-8624-6176ff41ad90"
* entry[=].resource = AbgabedatenBundleExample
* entry[+].fullUrl = "https://prescriptionserver.telematik/Bundle/dffbfd6a-5712-4798-bdc8-07201eb77ab8"
* entry[=].resource = QuittungsBundleExample

*/

Instance: App-ChargeItem-abc825bc-bc30-45f8-b109-1b343fff5c45
InstanceOf: ChargeItem
Usage: #inline
* meta.profile = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_ChargeItem|1.0"
* extension.url = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_EX_MarkingFlag"
* extension.extension[0].url = "insuranceProvider"
* extension.extension[=].valueBoolean = false
* extension.extension[+].url = "subsidy"
* extension.extension[=].valueBoolean = false
* extension.extension[+].url = "taxOffice"
* extension.extension[=].valueBoolean = false
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "200.086.824.605.539.20"
* status = #billable
* code = http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* subject.identifier.system = "http://fhir.de/sid/pkv/kvid-10"
* subject.identifier.value = "X234567890"
* enterer.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* enterer.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* enteredDate = "2021-06-01T07:13:00+05:00"
* supportingInformation[0] = Reference(Bundle/414ca393-dde3-4082-9a3b-3752e629e4aa) "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"
* supportingInformation[+] = Reference(Bundle/f548dde3-a319-486b-8624-6176ff41ad90) "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-AbgabedatenBundle"
* supportingInformation[+] = Reference(Bundle/dffbfd6a-5712-4798-bdc8-07201eb77ab8) "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle"

/*******************************************************/
/*

Dieser Block ist auskommentiert, da derzeit SUSHI noch einen Fehler enthält. Runde Dezimalwerte werden gerundet. Somit wird aus dem MwSteuersatz 19.00 -> 19
Die korrigierten Beispiele liegen unter /corrected_decimal_values_bundles
Falls Änderungen an den Beispielen geschehen sollen sind diese zu generieren -> korrigieren und dann in corrected_decimal_values_bundles zu kopieren.

Instance: Response_Apotheker_GETChargeItemById
InstanceOf: Bundle
Usage: #example
* id = "Response-Apotheker-GETChargeItemById"
* meta.lastUpdated = "2021-09-02T11:38:42.557+00:00"
* type = #searchset
* total = 2
* entry[0].fullUrl = "https://prescriptionserver.telematik/ChargeItem/abc825bc-bc30-45f8-b109-1b343fff5c45"
* entry[=].resource = Apotheker-ChargeItem-abc825bc-bc30-45f8-b109-1b343fff5c45
* entry[+].fullUrl = "https://prescriptionserver.telematik/Bundle/f548dde3-a319-486b-8624-6176ff41ad90"
* entry[=].resource = AbgabedatenBundleExample

Instance: Apotheker-ChargeItem-abc825bc-bc30-45f8-b109-1b343fff5c45
InstanceOf: ChargeItem
Usage: #inline
* meta.profile = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_ChargeItem|1.0"
* extension.url = "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_EX_MarkingFlag"
* extension.extension[0].url = "insuranceProvider"
* extension.extension[=].valueBoolean = false
* extension.extension[+].url = "subsidy"
* extension.extension[=].valueBoolean = false
* extension.extension[+].url = "taxOffice"
* extension.extension[=].valueBoolean = false
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "200.086.824.605.539.20"
* status = #billable
* code = http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* subject.identifier.system = "http://fhir.de/sid/pkv/kvid-10"
* subject.identifier.value = "X234567890"
* enterer.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* enterer.identifier.value = "3-SMC-B-Testkarte-883110000095957"
* enteredDate = "2021-06-01T07:13:00+05:00"
* supportingInformation[0] = Reference(Bundle/f548dde3-a319-486b-8624-6176ff41ad90) "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-AbgabedatenBundle"
*/
/*******************************************************/

Instance: PrescriptionBundleExample
InstanceOf: Bundle
Usage: #inline
* id = "414ca393-dde3-4082-9a3b-3752e629e4aa"
* meta.lastUpdated = "2022-05-20T08:30:00Z"
* meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle|1.1.0"
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "200.086.824.605.539.20"
* type = #document
* timestamp = "2022-05-20T08:30:00Z"
* entry[0].fullUrl = "http://pvs.praxis.local/fhir/Composition/1e33b2b8-770b-4dc2-8d73-74c1989540c4"
* entry[=].resource.resourceType = "Composition"
* entry[=].resource.id = "1e33b2b8-770b-4dc2-8d73-74c1989540c4"
* entry[=].resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Composition|1.1.0"
* entry[=].resource.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis"
* entry[=].resource.extension.valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_STATUSKENNZEICHEN#00
* entry[=].resource.status = #final
* entry[=].resource.type = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_FORMULAR_ART#e16A
* entry[=].resource.subject.reference = "Patient/30635f5d-c233-4500-94e8-6414940236aa"
* entry[=].resource.date = "2022-05-20T08:00:00Z"
* entry[=].resource.author[0].reference = "Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c"
* entry[=].resource.author[=].type = "Practitioner"
* entry[=].resource.author[+].type = "Device"
* entry[=].resource.author[=].identifier.system = "https://fhir.kbv.de/NamingSystem/KBV_NS_FOR_Pruefnummer"
* entry[=].resource.author[=].identifier.value = "Y/400/2107/36/999"
* entry[=].resource.title = "elektronische Arzneimittelverordnung"
* entry[=].resource.custodian.reference = "Organization/2a555cd3-0543-483c-88b3-f68647620962"
* entry[=].resource.section[0].code = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Section_Type#Prescription
* entry[=].resource.section[=].entry.reference = "MedicationRequest/c40ede18-da4b-11eb-8d19-0242ac130003"
* entry[=].resource.section[+].code = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Section_Type#Coverage
* entry[=].resource.section[=].entry.reference = "Coverage/e51239e1-ba74-48e0-97fb-9754d2b05c60"
* entry[+].fullUrl = "http://pvs.praxis.local/fhir/MedicationRequest/c40ede18-da4b-11eb-8d19-0242ac130003"
* entry[=].resource.resourceType = "MedicationRequest"
* entry[=].resource.id = "c40ede18-da4b-11eb-8d19-0242ac130003"
* entry[=].resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription|1.1.0"
* entry[=].resource.extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_StatusCoPayment"
* entry[=].resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_StatusCoPayment#0
* entry[=].resource.extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_EmergencyServicesFee"
* entry[=].resource.extension[=].valueBoolean = false
* entry[=].resource.extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_BVG"
* entry[=].resource.extension[=].valueBoolean = false
* entry[=].resource.extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription"
* entry[=].resource.extension[=].extension.url = "Kennzeichen"
* entry[=].resource.extension[=].extension.valueBoolean = false
* entry[=].resource.status = #active
* entry[=].resource.intent = #order
* entry[=].resource.medicationReference.reference = "Medication/125115cc-da48-11eb-8d19-0242ac130003"
* entry[=].resource.subject.reference = "Patient/30635f5d-c233-4500-94e8-6414940236aa"
* entry[=].resource.authoredOn = "2022-05-20"
* entry[=].resource.requester.reference = "Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c"
* entry[=].resource.insurance.reference = "Coverage/e51239e1-ba74-48e0-97fb-9754d2b05c60"
* entry[=].resource.dispenseRequest.quantity = 1 '{Package}'
* entry[=].resource.substitution.allowedBoolean = false
* entry[+].fullUrl = "http://pvs.praxis.local/fhir/Medication/125115cc-da48-11eb-8d19-0242ac130003"
* entry[=].resource.resourceType = "Medication"
* entry[=].resource.id = "125115cc-da48-11eb-8d19-0242ac130003"
* entry[=].resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
* entry[=].resource.extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
* entry[=].resource.extension[=].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
* entry[=].resource.extension[=].valueCodeableConcept.coding = http://snomed.info/sct#763158003 "Medicinal product (product)"
* entry[=].resource.extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
* entry[=].resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
* entry[=].resource.extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
* entry[=].resource.extension[=].valueBoolean = false
* entry[=].resource.extension[+].url = "http://fhir.de/StructureDefinition/normgroesse"
* entry[=].resource.extension[=].valueCode = #N2
* entry[=].resource.code = http://fhir.de/CodeSystem/ifa/pzn#10203603
* entry[=].resource.code.text = "ASPIRIN 500MG UEBERZ TABL, 20 St"
* entry[=].resource.form = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#UTA
* entry[+].fullUrl = "http://pvs.praxis.local/fhir/Patient/30635f5d-c233-4500-94e8-6414940236aa"
* entry[=].resource.resourceType = "Patient"
* entry[=].resource.id = "30635f5d-c233-4500-94e8-6414940236aa"
* entry[=].resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
* entry[=].resource.identifier.type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* entry[=].resource.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* entry[=].resource.identifier.value = "K220645122"
* entry[=].resource.name.use = #official
* entry[=].resource.name.family = "Schuhmann"
* entry[=].resource.name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* entry[=].resource.name.family.extension.valueString = "Schuhmann"
* entry[=].resource.name.given = "Sahra"
* entry[=].resource.birthDate = "1970-12-24"
* entry[=].resource.address.type = #both
* entry[=].resource.address.line = "Berliner Straße 1"
* entry[=].resource.address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* entry[=].resource.address.line.extension[=].valueString = "1"
* entry[=].resource.address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* entry[=].resource.address.line.extension[=].valueString = "Berliner Straße"
* entry[=].resource.address.city = "Husum"
* entry[=].resource.address.postalCode = "25813"
* entry[=].resource.address.country = "D"
* entry[+].fullUrl = "http://pvs.praxis.local/fhir/Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c"
* entry[=].resource.resourceType = "Practitioner"
* entry[=].resource.id = "d6f3b55d-3095-4655-96dc-da3bec21271c"
* entry[=].resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner|1.1.0"
* entry[=].resource.identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#LANR
* entry[=].resource.identifier.system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR"
* entry[=].resource.identifier.value = "754236701"
* entry[=].resource.name.use = #official
* entry[=].resource.name.family = "Schulz"
* entry[=].resource.name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
* entry[=].resource.name.family.extension.valueString = "Schulz"
* entry[=].resource.name.given = "Ben"
* entry[=].resource.qualification[0].code = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type#00
* entry[=].resource.qualification[+].code = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung#Berufsbezeichnung
* entry[=].resource.qualification[=].code.text = "Facharzt für Allgemeinmedizin"
* entry[+].fullUrl = "http://pvs.praxis.local/fhir/Organization/2a555cd3-0543-483c-88b3-f68647620962"
* entry[=].resource.resourceType = "Organization"
* entry[=].resource.id = "2a555cd3-0543-483c-88b3-f68647620962"
* entry[=].resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization|1.1.0"
* entry[=].resource.identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#BSNR
* entry[=].resource.identifier.system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
* entry[=].resource.identifier.value = "724444400"
* entry[=].resource.name = "Hausarztpraxis"
* entry[=].resource.telecom[0].system = #phone
* entry[=].resource.telecom[=].value = "030321654987"
* entry[=].resource.telecom[+].system = #email
* entry[=].resource.telecom[=].value = "hausarztpraxis@e-mail.de"
* entry[=].resource.address.type = #both
* entry[=].resource.address.line[0] = "Herbert-Lewin-Platz 2"
* entry[=].resource.address.line[+] = "Erdgeschoss"
* entry[=].resource.address.line[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* entry[=].resource.address.line[=].extension[=].valueString = "2"
* entry[=].resource.address.line[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* entry[=].resource.address.line[=].extension[=].valueString = "Herbert-Lewin-Platz"
* entry[=].resource.address.line[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
* entry[=].resource.address.line[=].extension.valueString = "Erdgeschoss"
* entry[=].resource.address.city = "Berlin"
* entry[=].resource.address.postalCode = "10623"
* entry[=].resource.address.country = "D"
* entry[+].fullUrl = "http://pvs.praxis.local/fhir/Coverage/e51239e1-ba74-48e0-97fb-9754d2b05c60"
* entry[=].resource.resourceType = "Coverage"
* entry[=].resource.id = "e51239e1-ba74-48e0-97fb-9754d2b05c60"
* entry[=].resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Coverage|1.1.0"
* entry[=].resource.extension[0].url = "http://fhir.de/StructureDefinition/gkv/besondere-personengruppe"
* entry[=].resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_PERSONENGRUPPE#00
* entry[=].resource.extension[+].url = "http://fhir.de/StructureDefinition/gkv/dmp-kennzeichen"
* entry[=].resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DMP#00
* entry[=].resource.extension[+].url = "http://fhir.de/StructureDefinition/gkv/wop"
* entry[=].resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ITA_WOP#01
* entry[=].resource.extension[+].url = "http://fhir.de/StructureDefinition/gkv/versichertenart"
* entry[=].resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_VERSICHERTENSTATUS#1
* entry[=].resource.status = #active
* entry[=].resource.type = http://fhir.de/CodeSystem/versicherungsart-de-basis#SEL
* entry[=].resource.beneficiary.reference = "Patient/30635f5d-c233-4500-94e8-6414940236aa"
* entry[=].resource.payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* entry[=].resource.payor.identifier.value = "108018347"
* entry[=].resource.payor.display = "AOK Baden-Württemberg"
* signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1
* signature.when = "2022-03-18T15:28:00+00:00"
* signature.who = Reference(https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1)
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="

Instance: AbgabedatenBundleExample
InstanceOf: Bundle
Usage: #inline
* id = "f548dde3-a319-486b-8624-6176ff41ad90"
* meta.profile = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-AbgabedatenBundle|1.1"
* meta.tag[0].display = "Beispiel RezeptAbgabedatenPKV Bundle (FAM + Noctu + Rezeptänderung)"
* type = #document
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "200.086.824.605.539.20"
* timestamp = "2022-03-25T23:40:00Z"
* entry[0].resource.resourceType = "Composition"
* entry[=].resource.id = "4dc5f425-b9b6-4e39-9166-42668ead6c86"
* entry[=].resource.meta.profile = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-AbgabedatenComposition|1.1"
* entry[=].resource.status = #final
* entry[=].resource.type = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-CS-ERP-CompositionTypes#ERezeptAbgabedaten
* entry[=].resource.title = "ERezeptAbgabedaten"
* entry[=].resource.section[0].title = "Abgabeinformationen"
* entry[=].resource.section[=].entry.reference = "urn:uuid:37a647b8-cb89-491a-af0f-f9bffc2b386c"
* entry[=].resource.section[+].title = "Apotheke"
* entry[=].resource.section[=].entry.reference = "urn:uuid:1fa57d53-812b-4cab-a42e-94a12481108a"
* entry[=].resource.date = "2022-03-25T23:40:00Z"
* entry[=].resource.author.reference = "urn:uuid:1fa57d53-812b-4cab-a42e-94a12481108a"
* entry[=].fullUrl = "urn:uuid:4dc5f425-b9b6-4e39-9166-42668ead6c86"
* entry[+].fullUrl = "urn:uuid:1fa57d53-812b-4cab-a42e-94a12481108a"
* entry[=].resource.resourceType = "Organization"
* entry[=].resource.id = "1fa57d53-812b-4cab-a42e-94a12481108a"
* entry[=].resource.meta.profile = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-Apotheke|1.1"
* entry[=].resource.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* entry[=].resource.identifier.value = "123456789"
* entry[=].resource.address.type = #physical
* entry[=].resource.address.line = "Taunusstraße 89"
* entry[=].resource.address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* entry[=].resource.address.line.extension[=].valueString = "Taunusstraße"
* entry[=].resource.address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* entry[=].resource.address.line.extension[=].valueString = "89"
* entry[=].resource.address.city = "Langen"
* entry[=].resource.address.postalCode = "63225"
* entry[=].resource.address.country = "D"
* entry[=].resource.name = "Adler-Apotheke"
* entry[+].fullUrl = "urn:uuid:37a647b8-cb89-491a-af0f-f9bffc2b386c"
* entry[=].resource.resourceType = "MedicationDispense"
* entry[=].resource.id = "37a647b8-cb89-491a-af0f-f9bffc2b386c"
* entry[=].resource.meta.profile = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-Abgabeinformationen|1.1"
* entry[=].resource.status = #completed
* entry[=].resource.medicationCodeableConcept = http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* entry[=].resource.type = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-CS-ERP-MedicationDispenseTyp#Abgabeinformationen
* entry[=].resource.extension[0].url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-EX-ERP-Abrechnungszeilen"
* entry[=].resource.extension[=].valueReference.reference = "urn:uuid:8a99bfa5-f7aa-4741-99d8-f1abbd301ae1"
* entry[=].resource.extension[+].url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-EX-ERP-AbrechnungsTyp"
* entry[=].resource.extension[=].valueCodeableConcept = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-PKV-CS-ERP-AbrechnungsTyp#1
* entry[=].resource.authorizingPrescription.identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* entry[=].resource.authorizingPrescription.identifier.value = "200.086.824.605.539.20"
* entry[=].resource.substitution.extension.extension[0].url = "ArtRezeptaenderung"
* entry[=].resource.substitution.extension.extension[=].valueCodeableConcept = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-PKV-CS-ERP-ArtRezeptaenderung#21
* entry[=].resource.substitution.extension.extension[+].url = "RueckspracheArzt"
* entry[=].resource.substitution.extension.extension[=].valueCodeableConcept = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-CS-ERP-RueckspracheArzt#2
* entry[=].resource.substitution.extension.url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-EX-ERP-Rezeptaenderung"
* entry[=].resource.substitution.wasSubstituted = true
* entry[=].resource.performer.actor.reference = "urn:uuid:1fa57d53-812b-4cab-a42e-94a12481108a"
* entry[=].resource.whenHandedOver = "2022-03-25"
* entry[+].fullUrl = "urn:uuid:8a99bfa5-f7aa-4741-99d8-f1abbd301ae1"
* entry[=].resource.resourceType = "Invoice"
* entry[=].resource.id = "8a99bfa5-f7aa-4741-99d8-f1abbd301ae1"
* entry[=].resource.meta.profile = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-PKV-PR-ERP-Abrechnungszeilen|1.1"
* entry[=].resource.status = #issued
* entry[=].resource.type = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-CS-ERP-InvoiceTyp#Abrechnungszeilen
* entry[=].resource.lineItem[0].priceComponent.type = #informational
* entry[=].resource.lineItem[=].priceComponent.extension[0].url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-EX-ERP-MwStSatz"
* entry[=].resource.lineItem[=].priceComponent.extension[=].valueDecimal = 19.00
* entry[=].resource.lineItem[=].priceComponent.extension[+].url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-EX-ERP-KostenVersicherter"
* entry[=].resource.lineItem[=].priceComponent.extension[=].extension[0].url = "Kategorie"
* entry[=].resource.lineItem[=].priceComponent.extension[=].extension[=].valueCodeableConcept = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-PKV-CS-ERP-KostenVersicherterKategorie#0
* entry[=].resource.lineItem[=].priceComponent.extension[=].extension[+].url = "Kostenbetrag"
* entry[=].resource.lineItem[=].priceComponent.extension[=].extension[=].valueMoney.currency = #EUR
* entry[=].resource.lineItem[=].priceComponent.extension[=].extension[=].valueMoney.value = 0.00
* entry[=].resource.lineItem[=].priceComponent.amount.currency = #EUR
* entry[=].resource.lineItem[=].priceComponent.amount.value = 48.98
* entry[=].resource.lineItem[=].priceComponent.factor = 2
* entry[=].resource.lineItem[=].sequence = 1
* entry[=].resource.lineItem[=].chargeItemCodeableConcept = http://fhir.de/CodeSystem/ifa/pzn#11514676
* entry[=].resource.lineItem[+].priceComponent.type = #informational
* entry[=].resource.lineItem[=].priceComponent.extension[0].url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-EX-ERP-MwStSatz"
* entry[=].resource.lineItem[=].priceComponent.extension[=].valueDecimal = 19.00
* entry[=].resource.lineItem[=].priceComponent.extension[+].url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-EX-ERP-KostenVersicherter"
* entry[=].resource.lineItem[=].priceComponent.extension[=].extension[0].url = "Kategorie"
* entry[=].resource.lineItem[=].priceComponent.extension[=].extension[=].valueCodeableConcept = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-PKV-CS-ERP-KostenVersicherterKategorie#0
* entry[=].resource.lineItem[=].priceComponent.extension[=].extension[+].url = "Kostenbetrag"
* entry[=].resource.lineItem[=].priceComponent.extension[=].extension[=].valueMoney.currency = #EUR
* entry[=].resource.lineItem[=].priceComponent.extension[=].extension[=].valueMoney.value = 0.00
* entry[=].resource.lineItem[=].priceComponent.amount.currency = #EUR
* entry[=].resource.lineItem[=].priceComponent.amount.value = 2.50
* entry[=].resource.lineItem[=].priceComponent.factor = 1
* entry[=].resource.lineItem[=].extension.extension.extension[0].url = "Gruppe"
* entry[=].resource.lineItem[=].extension.extension.extension[=].valueCodeableConcept = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-CS-ERP-ZusatzattributGruppe#11
* entry[=].resource.lineItem[=].extension.extension.extension[+].url = "DatumUhrzeit"
* entry[=].resource.lineItem[=].extension.extension.extension[=].valueDateTime = "2022-03-25T23:30:00.0Z"
* entry[=].resource.lineItem[=].extension.extension.extension[+].url = "Schluessel"
* entry[=].resource.lineItem[=].extension.extension.extension[=].valueBoolean = true
* entry[=].resource.lineItem[=].extension.extension.url = "ZusatzattributAbgabeNoctu"
* entry[=].resource.lineItem[=].extension.url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-EX-ERP-Zusatzattribute"
* entry[=].resource.lineItem[=].sequence = 2
* entry[=].resource.lineItem[=].chargeItemCodeableConcept = http://fhir.de/CodeSystem/ifa/pzn#02567018
* entry[=].resource.totalGross.currency = #EUR
* entry[=].resource.totalGross.extension.url = "http://fhir.abda.de/eRezeptAbgabedaten/StructureDefinition/DAV-EX-ERP-Gesamtzuzahlung"
* entry[=].resource.totalGross.extension.valueMoney.currency = #EUR
* entry[=].resource.totalGross.extension.valueMoney.value = 0.00
* entry[=].resource.totalGross.value = 51.48
* signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1
* signature.when = "2022-03-18T15:28:00+00:00"
* signature.who = Reference(https://pharmacy-konn/Device/1)
* signature.onBehalfOf.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* signature.onBehalfOf.identifier.value = "3-SMC-B-Testkarte-883110000129070"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="

Instance: QuittungsBundleExample
InstanceOf: Bundle
Usage: #inline
* id = "dffbfd6a-5712-4798-bdc8-07201eb77ab8"
* meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle|1.2"
* meta.tag.display = "Receipt Bundle 'Quittung' for completed dispensation of a prescription"
* type = #document
* identifier.system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier.value = "200.086.824.605.539.20"
* timestamp = "2022-03-18T15:28:00+00:00"
* entry[0].fullUrl = "urn:uuid:c624cf47-e235-4624-af71-0a09dc9254dc"
* entry[=].resource.resourceType = "Composition"
* entry[=].resource.id = "c624cf47-e235-4624-af71-0a09dc9254dc"
* entry[=].resource.meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Composition|1.2"
* entry[=].resource.status = #final
* entry[=].resource.title = "Quittung"
* entry[=].resource.extension.url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_Beneficiary"
* entry[=].resource.extension.valueIdentifier.system = "https://gematik.de/fhir/sid/telematik-id"
* entry[=].resource.extension.valueIdentifier.value = "3-SMC-B-Testkarte-883110000129070"
* entry[=].resource.type = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#3 "Receipt"
* entry[=].resource.date = "2022-03-18T15:29:00+00:00"
* entry[=].resource.author.reference = "https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1"
* entry[=].resource.event.period.start = "2022-03-18T15:28:00+00:00"
* entry[=].resource.event.period.end = "2022-03-18T15:29:00+00:00"
* entry[=].resource.section.entry.reference = "Binary/PrescriptionDigest-200.086.824.605.539.20"
* entry[+].fullUrl = "https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1"
* entry[=].resource.resourceType = "Device"
* entry[=].resource.id = "1"
* entry[=].resource.meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device|1.2"
* entry[=].resource.status = #active
* entry[=].resource.serialNumber = "1.4.0"
* entry[=].resource.deviceName.name = "E-Rezept-Fachdienst"
* entry[=].resource.deviceName.type = #user-friendly-name
* entry[=].resource.version.value = "1.4.0"
* entry[=].resource.contact.system = #email
* entry[=].resource.contact.value = "betrieb@gematik.de"
* entry[+].fullUrl = "https://erp.zentral.erp.splitdns.ti-dienste.de/Binary/PrescriptionDigest-200.086.824.605.539.20"
* entry[=].resource.resourceType = "Binary"
* entry[=].resource.id = "PrescriptionDigest-200.086.824.605.539.20"
* entry[=].resource.meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Digest|1.2"
* entry[=].resource.contentType = #application/octet-stream
* entry[=].resource.data = "tJg8c5ZtdhzEEhJ0ZpAsUVFx5dKuYgQFs5oKgthi17M="
* signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1
* signature.when = "2022-03-18T15:28:00+00:00"
* signature.who = Reference(https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1)
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="