Instance: ERPFachdienstClientErpChrg
InstanceOf: TICapabilityStatement
Usage: #definition
* insert MetaInstance(ERPFachdienstClientChrg)

* id = "erp-fachdienst-client"
* title = "ERPCHRG CapabilityStatement für Clients des E-Rezept-Fachdienst"
* description = "Dieses CapabilityStatement legt die Anforderungen an Clients des E-Rezept-Fachdienst für PKV-Abrechnungsinformationen fest."
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #client

* extension[baseUrl].valueString = "https://gematik.de/fhir/erpchrg"

* insert CapSupportResource(Task, #MAY)
* insert CapResourceInteraction(#read, #MAY)
* insert CapResourceInteraction(#search-type, #MAY)

* insert CapSupportResource(ChargeItem, #MAY)
* insert CapResourceInteraction(#read, #MAY)
* insert CapResourceInteraction(#search-type, #MAY)
* insert CapResourceInteraction(#create, #MAY)
* insert CapResourceInteraction(#update, #MAY)
* insert CapResourceInteraction(#patch, #MAY)
* insert CapResourceInteraction(#delete, #MAY)

* insert CapSupportResource(Consent, #MAY)
* insert CapResourceInteraction(#read, #MAY)
* insert CapResourceInteraction(#create, #MAY)
* insert CapResourceInteraction(#delete, #MAY)

* insert CapSupportResource(Communication, #MAY)
* insert CapResourceInteraction(#create, #MAY)