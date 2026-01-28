Query API: Communication

Die Query API für Communication beschreibt das Einstellen von Nachrichten im Rahmen der PKV‑Abrechnung (z. B. Änderungsanfragen der Abrechnungsinformation).

## POST /Communication

### Nachricht
Nachrichten werden als Communication‑Ressourcen an den E‑Rezept‑Fachdienst gesendet. Die verwendeten Profile richten sich nach der Kommunikationsbeziehung (Versicherter ↔ Apotheke).

**Beispiel-URI:** `https://prescriptionserver.telematik/Communication`

### Auslösung
Die Operation wird ausgelöst, wenn ein Versicherter eine Änderungsanfrage stellt oder die Apotheke antwortet.

### Resource API
<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Communication"
  data-api-fhir-interaction="create"
  data-api-operation-id="createCommunication">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Verarbeitung
<requirement conformance="SHALL" key="IG-ERP-CHRG-224" title="E-Rezept-Fachdienst – Nachricht einstellen – Schemaprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die HTTP-Operation POST auf den Endpunkt /Communication die im HTTP-Request-Body übergebene Communication-Ressource gegen das aus der Kommunikationsbeziehung ableitbare zulässige Schema prüfen und den Aufruf bei Nicht-Konformität mit dem http-Status-Code 400 ablehnen, damit ausschließlich konforme E-Rezept-Nachrichten ausgetauscht werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-225" title="E-Rezept-Fachdienst – Nachricht einstellen – Versicherte – Prüfung Versichertenbezug und Berechtigung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS das Einstellen einer Nachricht der Profile GEM_ERP_PR_Communication_DispReq, GEM_ERP_PR_Communication_InfoReq oder GEM_ERP_PR_Communication_Representative durch einen Versicherten über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn die KVNR des in Communication.basedOn referenzierten Tasks ungleich der KVNR des Einstellenden in "idNummer" des ACCESS_TOKEN ist und der HTTP-Header "X-AccessCode" fehlt oder ungleich dem AccessCode-Identifier des referenzierten Tasks ist, um irreführende Testnachrichten zu unterbinden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-226" title="E-Rezept-Fachdienst – Nachricht einstellen – Prüfung Existenz Task" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERP_PR_Communication_DispReq, GEM_ERP_PR_Communication_InfoReq, GEM_ERP_PR_Communication_Reply oder GEM_ERP_PR_Communication_Representative über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen Task referenziert, der nicht existiert, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-227" title="E-Rezept-Fachdienst – Nachricht einstellen – Prüfung Existenz ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERPCHRG_PR_Communication_ChargChangeReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReply über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen ChargeItem referenziert, der nicht existiert, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-228" title="E-Rezept-Fachdienst – Nachricht einstellen – Notification Apotheke" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERP_PR_Communication_DispReq, GEM_ERP_PR_Communication_InfoReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReq zur Versicherten-zu-Apotheken-Kommunikation über die HTTP-Operation POST auf den Endpunkt /Communication prüfen, ob für die Telematik-ID des Empfängers Subscriptions registriert sind und für Registrierungen über den Subscription Service eine Notification (ping : subscription-id) senden.
</requirement>

## Sicherheitsanforderungen
Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
