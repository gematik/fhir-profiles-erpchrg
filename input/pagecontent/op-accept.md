Operation: $accept

## Nachricht
Die Operation $accept wird als HTTP POST auf `/Task/<id>/$accept` ausgeführt.

## Auslösung
Die abgebende LEI ruft $accept auf, um ein E‑Rezept anzunehmen und – für Flowtype 200/209 – die Einwilligung zum Speichern der Abrechnungsinformationen zu berücksichtigen.

## FHIR Operation API
<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="type"
  data-api-operation-id="taskAccept">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

## Verarbeitung
<requirement conformance="SHALL" key="IG-ERP-CHRG-163" title="E-Rezept-Fachdienst – Task akzeptieren – Flowtype 200/209 – Einwilligung ermitteln" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$accept, wenn für die KVNR des begünstigten Versicherten (Task.for) eine Consent Ressource mit Consent.patient.identifier = KVNR und Consent.category.coding.code = "CHARGCONS" existiert, das Response Bundle um die Consent Ressource ergänzen, um der abgebenden LEI die Information zu übermitteln, ob der Versicherte eine Einwilligung zum Speichern der Abrechnungsinformationen auf dem E-Rezept-Fachdienst erteilt hat.
</requirement>

## Sicherheitsanforderungen
Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
