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
* entry[+]
  * fullUrl = "http://pvs.praxis.local/fhir/Composition/1e33b2b8-770b-4dc2-8d73-74c1989540c4"
  * resource.resourceType = "Composition"
  * resource.id = "1e33b2b8-770b-4dc2-8d73-74c1989540c4"
  * resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Composition|1.1.0"
  * resource.extension.url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_Legal_basis"
  * resource.extension.valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_STATUSKENNZEICHEN#00
  * resource.status = #final
  * resource.type = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_FORMULAR_ART#e16A
  * resource.subject.reference = "Patient/30635f5d-c233-4500-94e8-6414940236aa"
  * resource.date = "2022-05-20T08:00:00Z"
  * resource.author[0].reference = "Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c"
  * resource.author[=].type = "Practitioner"
  * resource.author[+].type = "Device"
  * resource.author[=].identifier.system = "https://fhir.kbv.de/NamingSystem/KBV_NS_FOR_Pruefnummer"
  * resource.author[=].identifier.value = "Y/400/2107/36/999"
  * resource.title = "elektronische Arzneimittelverordnung"
  * resource.custodian.reference = "Organization/2a555cd3-0543-483c-88b3-f68647620962"
  * resource.section[0].code = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Section_Type#Prescription
  * resource.section[=].entry.reference = "MedicationRequest/c40ede18-da4b-11eb-8d19-0242ac130003"
  * resource.section[+].code = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Section_Type#Coverage
  * resource.section[=].entry.reference = "Coverage/e51239e1-ba74-48e0-97fb-9754d2b05c60"
* entry[+]
  * fullUrl = "http://pvs.praxis.local/fhir/MedicationRequest/c40ede18-da4b-11eb-8d19-0242ac130003"
  * resource.resourceType = "MedicationRequest"
  * resource.id = "c40ede18-da4b-11eb-8d19-0242ac130003"
  * resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription|1.1.0"
  * resource.extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_FOR_StatusCoPayment"
  * resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_StatusCoPayment#0
  * resource.extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_EmergencyServicesFee"
  * resource.extension[=].valueBoolean = false
  * resource.extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_BVG"
  * resource.extension[=].valueBoolean = false
  * resource.extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Multiple_Prescription"
  * resource.extension[=].extension.url = "Kennzeichen"
  * resource.extension[=].extension.valueBoolean = false
  * resource.status = #active
  * resource.intent = #order
  * resource.medicationReference.reference = "Medication/125115cc-da48-11eb-8d19-0242ac130003"
  * resource.subject.reference = "Patient/30635f5d-c233-4500-94e8-6414940236aa"
  * resource.authoredOn = "2022-05-20"
  * resource.requester.reference = "Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c"
  * resource.insurance.reference = "Coverage/e51239e1-ba74-48e0-97fb-9754d2b05c60"
  * resource.dispenseRequest.quantity = 1 '{Package}'
  * resource.substitution.allowedBoolean = false
* entry[+]
  * fullUrl = "http://pvs.praxis.local/fhir/Medication/125115cc-da48-11eb-8d19-0242ac130003"
  * resource.resourceType = "Medication"
  * resource.id = "125115cc-da48-11eb-8d19-0242ac130003"
  * resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_PZN|1.1.0"
  * resource.extension[0].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type"
  * resource.extension[=].valueCodeableConcept.coding.version = "http://snomed.info/sct/900000000000207008/version/20220331"
  * resource.extension[=].valueCodeableConcept.coding = http://snomed.info/sct#763158003 "Medicinal product (product)"
  * resource.extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category"
  * resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_ERP_Medication_Category#00
  * resource.extension[+].url = "https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine"
  * resource.extension[=].valueBoolean = false
  * resource.extension[+].url = "http://fhir.de/StructureDefinition/normgroesse"
  * resource.extension[=].valueCode = #N2
  * resource.code = http://fhir.de/CodeSystem/ifa/pzn#10203603
  * resource.code.text = "ASPIRIN 500MG UEBERZ TABL, 20 St"
  * resource.form = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#UTA
* entry[+]
  * fullUrl = "http://pvs.praxis.local/fhir/Patient/30635f5d-c233-4500-94e8-6414940236aa"
  * resource.resourceType = "Patient"
  * resource.id = "30635f5d-c233-4500-94e8-6414940236aa"
  * resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Patient|1.1.0"
  * resource.identifier.type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
  * resource.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
  * resource.identifier.value = "K220645122"
  * resource.name.use = #official
  * resource.name.family = "Schuhmann"
  * resource.name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
  * resource.name.family.extension.valueString = "Schuhmann"
  * resource.name.given = "Sahra"
  * resource.birthDate = "1970-12-24"
  * resource.address.type = #both
  * resource.address.line = "Berliner Straße 1"
  * resource.address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
  * resource.address.line.extension[=].valueString = "1"
  * resource.address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
  * resource.address.line.extension[=].valueString = "Berliner Straße"
  * resource.address.city = "Husum"
  * resource.address.postalCode = "25813"
  * resource.address.country = "D"
* entry[+]
  * fullUrl = "http://pvs.praxis.local/fhir/Practitioner/d6f3b55d-3095-4655-96dc-da3bec21271c"
  * resource.resourceType = "Practitioner"
  * resource.id = "d6f3b55d-3095-4655-96dc-da3bec21271c"
  * resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Practitioner|1.1.0"
  * resource.identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#LANR
  * resource.identifier.system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR"
  * resource.identifier.value = "754236701"
  * resource.name.use = #official
  * resource.name.family = "Schulz"
  * resource.name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-own-name"
  * resource.name.family.extension.valueString = "Schulz"
  * resource.name.given = "Ben"
  * resource.qualification[0].code = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Qualification_Type#00
  * resource.qualification[+].code = https://fhir.kbv.de/CodeSystem/KBV_CS_FOR_Berufsbezeichnung#Berufsbezeichnung
  * resource.qualification[=].code.text = "Facharzt für Allgemeinmedizin"
* entry[+]
  * fullUrl = "http://pvs.praxis.local/fhir/Organization/2a555cd3-0543-483c-88b3-f68647620962"
  * resource.resourceType = "Organization"
  * resource.id = "2a555cd3-0543-483c-88b3-f68647620962"
  * resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Organization|1.1.0"
  * resource.identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#BSNR
  * resource.identifier.system = "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR"
  * resource.identifier.value = "724444400"
  * resource.name = "Hausarztpraxis"
  * resource.telecom[0].system = #phone
  * resource.telecom[=].value = "030321654987"
  * resource.telecom[+].system = #email
  * resource.telecom[=].value = "hausarztpraxis@e-mail.de"
  * resource.address.type = #both
  * resource.address.line[0] = "Herbert-Lewin-Platz 2"
  * resource.address.line[+] = "Erdgeschoss"
  * resource.address.line[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
  * resource.address.line[=].extension[=].valueString = "2"
  * resource.address.line[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
  * resource.address.line[=].extension[=].valueString = "Herbert-Lewin-Platz"
  * resource.address.line[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator"
  * resource.address.line[=].extension.valueString = "Erdgeschoss"
  * resource.address.city = "Berlin"
  * resource.address.postalCode = "10623"
  * resource.address.country = "D"
* entry[+]
  * fullUrl = "http://pvs.praxis.local/fhir/Coverage/e51239e1-ba74-48e0-97fb-9754d2b05c60"
  * resource.resourceType = "Coverage"
  * resource.id = "e51239e1-ba74-48e0-97fb-9754d2b05c60"
  * resource.meta.profile = "https://fhir.kbv.de/StructureDefinition/KBV_PR_FOR_Coverage|1.1.0"
  * resource.extension[0].url = "http://fhir.de/StructureDefinition/gkv/besondere-personengruppe"
  * resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_PERSONENGRUPPE#00
  * resource.extension[+].url = "http://fhir.de/StructureDefinition/gkv/dmp-kennzeichen"
  * resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DMP#00
  * resource.extension[+].url = "http://fhir.de/StructureDefinition/gkv/wop"
  * resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ITA_WOP#01
  * resource.extension[+].url = "http://fhir.de/StructureDefinition/gkv/versichertenart"
  * resource.extension[=].valueCoding = https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_VERSICHERTENSTATUS#1
  * resource.status = #active
  * resource.type = http://fhir.de/CodeSystem/versicherungsart-de-basis#SEL
  * resource.beneficiary.reference = "Patient/30635f5d-c233-4500-94e8-6414940236aa"
  * resource.payor.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
  * resource.payor.identifier.value = "108018347"
  * resource.payor.display = "AOK Baden-Württemberg"
* signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1
* signature.when = "2022-03-18T15:28:00+00:00"
* signature.who = Reference(https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1)
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "U2lnbmF0dXIgZGVzIFZlcm9yZG51bmdzZGF0ZW5zYXR6ZXMgZGVzIEFyenRlcw=="
