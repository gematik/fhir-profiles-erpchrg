Die _Query API: Organization_ ermöglicht den Abruf von Daten zu Leistungserbringerinstitutionen wie Praxen oder Apotheken im Medication Service.


### Nachricht

Die Nachricht zum Abruf von Daten zu Leistungserbringerinstitutionen wird als HTTP GET-Anfrage an den Medication Service gesendet, um eine Liste der hinterlegten _Organization_-Instanzen abzurufen.


#### Auslösung

Wenn das ePA-Client-System eine Suche nach Leistungserbringerinstitutionen durchführen und dazu die korrespondierenden _Organization_-Ressourcen ermitteln möchte, sendet es eine _Query API: Organization_-Nachricht an den Medication Service. Das ePA-Client-System verarbeitet die Antwort und bringt sie ggf. zur Anzeige.


#### Resource API

Anfragen an die <i>Organization</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern.

Bei Anfragen an die QueryAPI für die <i>Organization</i>-Ressource wird die Antwort als ein FHIR Bundle des Typs <i>searchset</i> zurückgegeben. Dieses Bundle enthält eine Sammlung von Einträgen, die jeweils eine Instanz der <i>Organization</i>-Ressource oder weitere Ressourcen im Zusammenhang mit der Abfrage enthalten können.

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Organization"
  data-api-fhir-interaction="search-type"
  data-api-operation-id="listOrganizations_MedicationSvc">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-epa-medication-service-server.json %}
    </pre>
  </div>
</div>


#### Verarbeitung

Der Medication Service verarbeitet die Anfrage, um die _Organization_-Einträge zu ermitteln, die den angegebenen Suchparametern entsprechen. Darüber hinaus gibt er einen zur Verarbeitung passenden HTTP Status Code sowie ein [FHIR Bundle](https://hl7.org/fhir/R4/bundle.html) der passenden _Organization_-Ressourcen zurück.

<requirement conformance="SHALL"  title="Verarbeitung von Suchparametern für Organization" version="0">
    <meta lockversion="false"/>
    <actor name="EPA-Medication-Service">
        <testProcedure id="Produkttest"/>
    </actor>
    Der Medication Service MUSS die Suchparameter der Ressource <i>Organization</i> verarbeiten können, wie sie im <i><a href="./CapabilityStatement-epa-medication-service-server.html">CapabilityStatement</a></i> mit dem Namen <i>EPAMedicationServiceServer</i> festgelegt sind.
</requirement>

<requirement actor="EPA-Medication-Service" conformance="SHALL"  title="Standardsortierung für Organization" version="3">
    <meta lockversion="false"/>
    <actor name="EPA-Medication-Service">
        <testProcedure id="Produkttest"/>
    </actor>
    Die Standardsortierung des Medication Service für die Ressource <i>Organization</i> MUSS anhand des Attributs <i>_lastUpdated</i> in absteigender Reihenfolge erfolgen, sodass die neuesten Daten zuerst angezeigt werden.
</requirement>


#### Resource API (Versionshistorie)

Anfragen an die <i>Organization</i>-Ressource können über die RESTful API mittels HTTP GET-Anfragen durchgeführt werden. Dabei können spezifische Suchparameter genutzt werden, um die Anfragen zu verfeinern.

Bei Anfragen an die QueryAPI für die <i>Organization</i>-Ressource wird die Antwort als ein FHIR Bundle des Typs <i>history</i> zurückgegeben. Dieses Bundle enthält eine Sammlung von Einträgen, die jeweils eine Instanz der <i>Organization</i>-Ressource oder weitere Ressourcen im Zusammenhang mit der Abfrage enthalten können.

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Organization"
  data-api-fhir-interaction="history-type"
  data-api-operation-id="listOrganizations_MedicationSvc">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-epa-medication-service-server.json %}
    </pre>
  </div>
</div>


#### Instance API

Um spezifische Details zu einer einzelnen _Organization_-Instanz mittels der RESTful API zu erhalten, kann die _Organization Instance API_ verwendet werden, sodass eine HTTP GET-Anfrage an den Endpunkt <i>/Organization/[id]</i> gerichtet wird.

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Organization"
  data-api-fhir-interaction="read"
  data-api-operation-id="getOrganizationById_MedicationSvc">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-epa-medication-service-server.json %}
    </pre>
  </div>
</div>

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Organization"
  data-api-fhir-interaction="history-instance"
  data-api-operation-id="getOrganizationById_MedicationSvc">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-epa-medication-service-server.json %}
    </pre>
  </div>
</div>

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="Organization"
  data-api-fhir-interaction="vread"
  data-api-operation-id="getOrganizationById_MedicationSvc">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-epa-medication-service-server.json %}
    </pre>
  </div>
</div>


### Sicherheitsanforderungen

Generelle Sicherheitsanforderungen werden [hier](./privacy-security.html) festgehalten.