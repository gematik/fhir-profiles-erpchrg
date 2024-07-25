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
* entry[+]
  * fullUrl = "urn:uuid:c624cf47-e235-4624-af71-0a09dc9254dc"
  * resource.resourceType = "Composition"
  * resource.id = "c624cf47-e235-4624-af71-0a09dc9254dc"
  * resource.meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Composition|1.2"
  * resource.status = #final
  * resource.title = "Quittung"
  * resource.extension.url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_Beneficiary"
  * resource.extension.valueIdentifier.system = "https://gematik.de/fhir/sid/telematik-id"
  * resource.extension.valueIdentifier.value = "3-SMC-B-Testkarte-883110000129070"
  * resource.type = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType#3 "Receipt"
  * resource.date = "2022-03-18T15:29:00+00:00"
  * resource.author.reference = "https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1"
  * resource.event.period.start = "2022-03-18T15:28:00+00:00"
  * resource.event.period.end = "2022-03-18T15:29:00+00:00"
  * resource.section.entry.reference = "Binary/PrescriptionDigest-200.086.824.605.539.20"
* entry[+]
  * fullUrl = "https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1"
  * resource.resourceType = "Device"
  * resource.id = "1"
  * resource.meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device|1.2"
  * resource.status = #active
  * resource.serialNumber = "1.4.0"
  * resource.deviceName.name = "E-Rezept-Fachdienst"
  * resource.deviceName.type = #user-friendly-name
  * resource.version.value = "1.4.0"
  * resource.contact.system = #email
  * resource.contact.value = "betrieb@gematik.de"
* entry[+]
  * fullUrl = "https://erp.zentral.erp.splitdns.ti-dienste.de/Binary/PrescriptionDigest-200.086.824.605.539.20"
  * resource.resourceType = "Binary"
  * resource.id = "PrescriptionDigest-200.086.824.605.539.20"
  * resource.meta.profile = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Digest|1.2"
  * resource.contentType = #application/octet-stream
  * resource.data = "tJg8c5ZtdhzEEhJ0ZpAsUVFx5dKuYgQFs5oKgthi17M="
* signature.type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1
* signature.when = "2022-03-18T15:28:00+00:00"
* signature.who = Reference(https://erp.zentral.erp.splitdns.ti-dienste.de/Device/1)
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="