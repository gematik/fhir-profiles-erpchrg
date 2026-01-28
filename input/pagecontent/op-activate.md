Operation: $activate

## Nachricht
Die Operation $activate wird als HTTP POST auf `/Task/<id>/$activate` ausgeführt.

## Auslösung
Die abgebende LEI aktiviert den Task. Für Flowtype 200/209 muss der Versicherungstyp PKV im Verordnungsdatensatz geprüft werden.

## FHIR Operation API
<div class="gematik-api"
  data-api-type="FHIROperation"
  data-api-fhir-invoke-level="type"
  data-api-operation-id="taskActivate">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

## Verarbeitung
<requirement conformance="SHALL" key="IG-ERP-CHRG-164" title="E-Rezept-Fachdienst – Task aktivieren – Flowtype 200/209 – Prüfung Coverage Type" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob Coverage.type.coding.code mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nur für E-Rezepte für PKV-Versicherte genutzt werden.
</requirement>

## Sicherheitsanforderungen
Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
