Instance: 5dc67a4f-c936-4c26-a7c0-967673a70740
InstanceOf: DAV-PKV-PR-ERP-Apotheke
Title: "Beispiel Apotheke"
Usage: #inline
* identifier[+].value = "308412345"
* name = "Adler-Apotheke"
* address[+].line = "Taunusstraße 89"
* address[=].line.extension[Strasse].valueString = "Taunusstraße"
* address[=].line.extension[Hausnummer].valueString = "89"
* address[=].city = "Langen"
* address[=].postalCode = "63225"
* address[=].country = "D"

Instance: cfd49ec7-fd9c-4ab3-865f-f0aaf010ca19
InstanceOf: DAV-PKV-PR-ERP-Abrechnungszeilen
Title: "Beispiel Abrechnungszeilen"
Usage: #inline
* status = #issued
* type.coding.code = #Abrechnungszeilen
* lineItem[+].sequence = 1 // Zähler Abrechnungszeile
* lineItem[=].chargeItemCodeableConcept.coding[PZN] = http://fhir.de/CodeSystem/ifa/pzn#06313728 // Sumatriptan 1A Pharma 100 mg Tabletten, 12 St
* lineItem[=].chargeItemCodeableConcept.text = "Sumatriptan 1A Pharma 100 mg Tabletten, 12 St"
* lineItem[=].priceComponent.extension[MwSt-Satz].valueDecimal = 19.00
* lineItem[=].priceComponent.extension[KostenVersicherter].extension[Kategorie].valueCodeableConcept.coding = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-PKV-CS-ERP-KostenVersicherterKategorie#0
* lineItem[=].priceComponent.extension[KostenVersicherter].extension[Kostenbetrag].valueMoney.value = 0.00
* lineItem[=].priceComponent.type = #informational
* lineItem[=].priceComponent.factor = 1
* lineItem[=].priceComponent.amount.value = 30.33
* totalGross[+].extension[Gesamtzuzahlung].valueMoney.value = 0.00
* totalGross[=].value = 30.33

Instance: 335784b4-3f89-47cc-b32f-bc386a212e11
InstanceOf: DAV-PKV-PR-ERP-Abgabeinformationen
Title: "Beispiel Abgabeinformationen"
Usage: #inline
* extension[Abrechnungszeilen].valueReference = Reference(urn:uuid:cfd49ec7-fd9c-4ab3-865f-f0aaf010ca19)
* extension[AbrechnungsTyp].valueCodeableConcept.coding = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-PKV-CS-ERP-AbrechnungsTyp#1
* status = #completed
// * medicationCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/data-absent-reason#not-applicable
* performer.actor = Reference(urn:uuid:5dc67a4f-c936-4c26-a7c0-967673a70740)
* authorizingPrescription.identifier[+].value = "200.100.000.000.081.90"
// * type.coding.code = #Abgabeinformationen
* whenHandedOver = "2023-07-24"

Instance: 72183b44-61cf-4fe7-8f74-1e37d58fcea8
InstanceOf: DAV-PKV-PR-ERP-AbgabedatenComposition
Title: "Beispiel Abgabedaten Composition"
Usage: #inline
* type = http://fhir.abda.de/eRezeptAbgabedaten/CodeSystem/DAV-CS-ERP-CompositionTypes#ERezeptAbgabedaten
* date = "2023-07-24T11:30:00Z"
* author = Reference(urn:uuid:5dc67a4f-c936-4c26-a7c0-967673a70740)
* section[Abgabeinformationen].entry.reference = "urn:uuid:335784b4-3f89-47cc-b32f-bc386a212e11"
* section[Apotheke].entry.reference = "urn:uuid:5dc67a4f-c936-4c26-a7c0-967673a70740"

Instance: AbgabedatenBundleExample
InstanceOf: DAV-PKV-PR-ERP-AbgabedatenBundle
Title: "Beispiel RezeptAbgabedatenPKV Bundle Beispielangabe FAM"
Usage: #inline
* id = "f548dde3-a319-486b-8624-6176ff41ad90"
* meta.tag.display = "Beispiel RezeptAbgabedatenPKV Bundle (FAM)"
* meta.tag[+].display = "ACHTUNG! Der fachlich korrekte Inhalt der Beispielinstanz kann nicht gewährleistet werden. Wir sind jederzeit dankbar für Hinweise auf Fehler oder für Verbesserungsvorschläge."
* identifier.value = "200.100.000.000.081.90"
* timestamp = "2023-07-24T11:30:00Z"
* entry[ERezeptAbgabedaten].resource = 72183b44-61cf-4fe7-8f74-1e37d58fcea8
* entry[ERezeptAbgabedaten].fullUrl = "urn:uuid:72183b44-61cf-4fe7-8f74-1e37d58fcea8"
* entry[Apotheke].resource = 5dc67a4f-c936-4c26-a7c0-967673a70740
* entry[Apotheke].fullUrl = "urn:uuid:5dc67a4f-c936-4c26-a7c0-967673a70740"
* entry[Abgabeinformationen].resource = 335784b4-3f89-47cc-b32f-bc386a212e11
* entry[Abgabeinformationen].fullUrl = "urn:uuid:335784b4-3f89-47cc-b32f-bc386a212e11"
* entry[Abrechnungszeilen].resource = cfd49ec7-fd9c-4ab3-865f-f0aaf010ca19
* entry[Abrechnungszeilen].fullUrl = "urn:uuid:cfd49ec7-fd9c-4ab3-865f-f0aaf010ca19"
* signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1
* signature.when = "2022-03-18T15:28:00+00:00"
* signature.who = Reference(https://pharmacy-konn/Device/1)
* signature.onBehalfOf.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* signature.onBehalfOf.identifier.value = "3-SMC-B-Testkarte-883110000129070"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "U2lnbmF0dXIgZGVzIEFiZ2FiZWRhdGVuc2F0emVzIGRlciBBcG90aGVrZQ=="