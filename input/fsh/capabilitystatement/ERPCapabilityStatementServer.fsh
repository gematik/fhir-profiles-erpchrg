Instance: ERPFachdienstServerErpChrg
InstanceOf: TICapabilityStatement
Usage: #definition
* insert MetaInstance(ERPFachdienstServerChrg)

* id = "erp-fachdienst-server-erpchrg"
* title = "ERPCHRG CapabilityStatement für den E-Rezept-Fachdienst"
* description = "CapabilityStatement für den E-Rezept-Fachdienst (PKV-Abrechnungsinformationen)"
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* imports = $cap-erp-fd
* rest.mode = #server
* extension[baseUrl].valueString = "https://gematik.de/fhir/erpchrg"

* insert CapSupportResource(Task, #SHALL)
* insert CapResourceInteraction(#read, #SHALL)
* insert CapResourceInteraction(#search-type, #SHALL)

* insert CapSupportResource(ChargeItem, #SHALL)
* insert CapResourceInteraction(#read, #SHALL)
* insert CapResourceInteraction(#search-type, #SHALL)
* insert CapResourceInteraction(#create, #SHALL)
* insert CapResourceInteraction(#update, #SHALL)
* insert CapResourceInteraction(#patch, #SHALL)
* insert CapResourceInteraction(#delete, #SHALL)

* insert CapSupportResource(Consent, #SHALL)
* insert CapResourceInteraction(#read, #SHALL)
* insert CapResourceInteraction(#create, #SHALL)
* insert CapResourceInteraction(#delete, #SHALL)

* insert CapSupportResource(Communication, #SHALL)
* insert CapResourceInteraction(#create, #SHALL)

