Query API: Task

Die Query API für Task beschreibt den lesenden Zugriff auf Tasks. PKV‑spezifische Vorgänge erfolgen über die Operationen $accept und $activate und sind auf den jeweiligen Operationsseiten beschrieben.

## GET /Task (Suche)

### Nachricht
Clients können Tasks suchen (z. B. nach Status oder Identifiern), um den Bearbeitungsstand zu ermitteln.

### Resource API
<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Task"
  data-api-fhir-interaction="search-type"
  data-api-operation-id="searchTask">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

## GET /Task/<id> (Details)

### Nachricht
Der Detailabruf liefert die Task‑Ressource zu einer bekannten Task‑ID.

### Resource API
<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Task"
  data-api-fhir-interaction="read"
  data-api-operation-id="readTask">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

## Weiterführende Operationen
- [$accept](./op-accept.html)
- [$activate](./op-activate.html)
