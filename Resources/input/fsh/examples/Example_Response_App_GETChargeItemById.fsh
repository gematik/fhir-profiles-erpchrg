/*******************************************************/
/*

Dieser Block ist auskommentiert, da derzeit SUSHI noch einen Fehler enthält. Runde Dezimalwerte werden gerundet. Somit wird aus dem MwSteuersatz 19.00 -> 19
Die korrigierten Beispiele liegen unter /corrected_decimal_values_bundles
Falls Änderungen an den Beispielen geschehen sollen sind diese zu generieren -> korrigieren und dann in corrected_decimal_values_bundles zu kopieren.
https://github.com/FHIR/sushi/issues/1215
*/
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
