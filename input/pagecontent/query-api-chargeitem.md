Query API: ChargeItem

Die Query API für ChargeItem ermöglicht den Zugriff auf Abrechnungsinformationen (Verordnungsdatensatz, PKV‑Abgabedatensatz, Quittung). Die Abrechnungsinformation wird als ChargeItem mit Referenzen auf die Datensätze abgebildet.

## Profilierung
Die Profilierung der Ressource ChargeItem ist hier dokumentiert: https://simplifier.net/erezept-patientenrechnung/gem_erpchrg_pr_chargeitem

## Allgemeine Regeln
<requirement conformance="SHALL" key="IG-ERP-CHRG-165" title="E-Rezept-Fachdienst – ChargeItem – unzulässige Operationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource ChargeItem mittels der HTTP-Operationen HEAD unterbinden, damit keine unzulässigen Operationen auf die Informationen zu Abrechnungsinformationen ausgeführt werden können.
</requirement>

## GET /ChargeItem (Liste)

### Nachricht
Versicherte rufen ihre Abrechnungsinformationen als Liste ab. Die Antwort ist ein Bundle vom Typ searchset ohne die referenzierten Datensätze.

**Beispiel-URI:** `https://erp.zentral.erp.splitdns.ti-dienste.de/ChargeItem/`

Hinweis: Liegt keine Einwilligung vor, wird eine leere Liste zurückgegeben, da nach Widerruf alle Abrechnungsinformationen gelöscht wurden.

### Auslösung
Die Operation wird im FdV/AdV ausgelöst, z. B. beim Abruf der Liste oder nach Gerätewechsel.

### Resource API

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="ChargeItem"
  data-api-fhir-interaction="search-type"
  data-api-operation-id="searchChargeItem">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Verarbeitung

<requirement conformance="SHALL" key="IG-ERP-CHRG-170" title="E-Rezept-Fachdienst – Abrechnungsinformationen abrufen – Rollenprüfung Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-171" title="E-Rezept-Fachdienst – Abrechnungsinformationen abrufen – Versicherter – Filter KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und die ChargeItems danach filtern, damit der Versicherte nur Abrechnungsinformationen abruft, bei denen er der Begünstigte ist.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-172" title="E-Rezept-Fachdienst – Abrechnungsinformationen abrufen – Suchkriterien" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS das Eingrenzen einer Suchanfrage auf /ChargeItem über die URL-Parameter gemäß https://www.hl7.org/fhir/chargeitem.html#search mindestens für die Attribute ChargeItem.enteredDate und ChargeItem.meta.__lastUpdated erlauben, damit Versicherte und Apotheken eine Suche nach neuen Abrechnungsinformationseinträgen durchführen können.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-173" title="E-Rezept-Fachdienst – Abrechnungsinformationen abrufen – Response" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem eine Liste von ChargeItem Ressourcen ohne die in supportingInformation referenzierten Datensätze entsprechend der Filterung und Suchkriterien übermitteln.
</requirement>

<requirement conformance="MAY" key="IG-ERP-CHRG-174" title="E-Rezept-Fachdienst – Abrechnungsinformationen abrufen – Paging" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst KANN beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem das Suchergebnis in einem Paging-Mechanismus auf mehrere Ergebnis-Bundle aufteilen, damit der Nutzer eine komfortable Navigationsmöglichkeit in seinen Abrechnungsinformationen erhält.
</requirement>

## GET /ChargeItem/<id> (Details)

### Nachricht
Der Detailabruf liefert ein Bundle mit ChargeItem, Verordnungsdatensatz, PKV‑Abgabedatensatz und Quittung. Für Versicherte werden die Datensätze durch den E‑Rezept‑Fachdienst signiert.

**Beispiel-URI (Versicherter):** `https://prescriptionserver.telematik/ChargeItem/200.000.001.944.091.20`

**Beispiel-URI (abgebende LEI):** `https://prescriptionserver.telematik/ChargeItem/200.000.001.944.091.20?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea`

### Auslösung
Der Detailabruf erfolgt aus dem FdV/AdV oder durch die abgebende LEI (mit AccessCode), z. B. zur Korrektur.

### Resource API

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="ChargeItem"
  data-api-fhir-interaction="read"
  data-api-operation-id="readChargeItem">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Verarbeitung

<requirement conformance="SHALL" key="IG-ERP-CHRG-175" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Rollenprüfung Versicherter oder Apotheker" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Versicherte oder Apotheken in den Rollen oid_versicherter, oid_oeffentliche_apotheke oder oid_krankenhausapotheke die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-176" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Versicherter – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation abrufen kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-177" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – Prüfung Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution, die LEI anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.enterer.identifier hinterlegte Telematik-ID der einstellenden LEI prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die LEI eine Abrechnungsinformation abrufen kann, welche die Abrechnungsinformation bereitgestellt hat.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-178" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – Prüfung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution, den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCodeChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-179" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Versicherte – Signieren" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /ChargeItem/<id> durch einen Versicherten zusätzlich zum ChargeItem die folgenden Datensätze im JSON-Format in einem Responsebundle zurück liefern und dafür in jedem Aufruf den Verordnungsdatensatz, den PKV-Abgabedatensatz und die Quittung im XML-Format mit der Signaturidentität des E-Rezept-Fachdienstes gemäß RFC5652 im Profil CAdES-BES (Enveloping) signieren und in jede Fachdienstsignatur die letzte OCSP-Antwort der Statusprüfung des Signaturzertifikats C.FD.OSIG einbetten, damit der Versicherte die Daten für die Abrechnung an Kostenträger weiterleiten kann.
</requirement>

<requirement conformance="SHALL NOT" key="IG-ERP-CHRG-180" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – kein AccessCode und Quittung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst DARF beim Aufruf der Operation GET /ChargeItem/<id> durch eine abgebende Leistungserbringerinstitution das in ChargeItem.supportingInformation referenzierte Element ChargeItem.supportingInformation:receipt und den Identifier Task.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nur den Verordnungsdatensatz und den durch sie änderbaren PKV-Abgabedatensatz erhält.
</requirement>

## POST /ChargeItem (Bereitstellen)

### Nachricht
Die abgebende LEI stellt die Abrechnungsinformation bereit, indem sie ein ChargeItem an den E‑Rezept‑Fachdienst übermittelt. Das ChargeItem enthält Referenzen auf Verordnungsdatensatz und Quittung sowie den PKV‑Abgabedatensatz (contained Binary). Für die Berechtigungsprüfung werden Task‑ID und Secret über URL‑Parameter übermittelt.

**Beispiel-URI:** `https://prescriptionserver.telematik/ChargeItem?task=200.000.001.944.091.20&secret=c36ca26502892b371d252c99b496e31505ff449aca9bc69e231c58148f6233cf`

Hinweis: In VAU‑Requests sind u. a. die Header `X-erp-user: l` und `X-erp-resource: ChargeItem` zu setzen.

### Auslösung
Die Operation wird nach der Belieferung ausgelöst, sobald eine Einwilligung des Versicherten vorliegt und die Abrechnungsinformation digital bereitgestellt werden soll.

### Resource API

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="ChargeItem"
  data-api-fhir-interaction="create"
  data-api-operation-id="createChargeItem">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Verarbeitung

<requirement conformance="SHALL" key="IG-ERP-CHRG-185" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ausschließlich Nutzer in den Rollen oid_oeffentliche_apotheke oder oid_krankenhausapotheke die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte eingestellt werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-186" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Parameter Task" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ein URL-Parameter "task=..." übermittelt wurde und bei Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 400 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-187" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Existenz Task" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass zu der im URL-Parameter "task=..." übertragene Task-ID eine Task-Ressource mit dem Status Task.status = completed existiert und bei fehlgeschlagener Prüfung mit dem HTTP-Fehlercode 409 abbrechen, damit nur eine Abrechnungsinformation für E-Rezepte mit dem Status „quittiert“ angelegt wird.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-188" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Secret Task" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das im URL-Parameter "secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte SecretTask.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch die berechtigten Apotheke in Kenntnis des Secrets erfolgt.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-189" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Flowtype Task" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass der im URL-Parameter "task=..." referenzierte Task den Flowtype Task.extension:flowType = 200 oder 209 besitzt und bei fehlgeschlagener Prüfung mit dem HTTP-Fehlercode 400 abbrechen, damit nur eine Abrechnungsinformation für E-Rezepte mit zulässigen Flowtype angelegt wird.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-190" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Einwilligung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass zu der in ChargeItem.subject.identifier übermittelten KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = CHARGCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur eine Abrechnungsinformation für Versicherte gespeichert wird, die eine Einwilligung erteilt haben.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-191" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – FHIR-Validierung ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource ChargeItem übertragene ChargeItem-Ressource gegen das FHIR-Profil ChargeItem prüfen und die Korrektheit der Rezept-ID (GEM_ERP_PR_PrescriptionId) im referenzierten Task als ChargeItem.identifier, die Korrektheit der Versicherten-ID des Versicherten im referenzierten Task (Task.for) gegen ChargeItem.subject.identifier sowie die Korrektheit der Telematik-ID der Apotheke gemäß ACCESS_TOKEN mit dem Wert in ChargeItem.enterer.identifier prüfen und bei Nicht-Konformität das Anlegen der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-192" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – PKV-Abgabedatensatz übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem den im containedBinary übermittelten PKV-Abgabedatensatz herauslösen und entfernen, die Ressource zur ChargeItem-Ressource speichern und in ChargeItem.supportingInformation:dispenseItem die Referenz hinzufügen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-193" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – FHIR-Validierung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource ChargeItem übertragene PKV-Abgabedatensatz-Ressource gegen das FHIR-Profil DAV-PKV-PR-ERP-AbgabedatenBundle prüfen und bei Nicht-Konformität das Anlegen der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-194" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Signaturprüfung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem die Signatur des PKV-Abgabedatensatzes gemäß ETSI_QES prüfen und bei fehlender oder nicht gültiger Signatur mit Status 400 abbrechen, um ausschließlich authentische Daten zu verwalten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-195" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Signaturzertifikat PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das Signaturzertifikat des PKV-Abgabedatensatzes prüfen. Das Signaturzertifikat muss anhand der Zertifikatsprüfung für mathematisch gültig, zeitlich gültig und online gültig befunden werden und der Aufruf anderenfalls mit Status 400 abgebrochen werden, um ausschließlich authentische Daten zu verwalten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-196" title="E-Rezept-Fachdienst – Signaturzertifikat SMC-B prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS ein Signatur-Zertifikat einer nonQES-Signatur einer Leistungserbringerinstitution gemäß gemSpec_PKI#TUC_PKI_018 mit den Parametern oid_smc_b_osig, intendedKeyUsage nonRepudiation, intendedExtendedKeyUsage leer, OCSP-Graceperiod 12 Stunden, Offline-Modus nein, Prüfmodus OCSP auf Gültigkeit prüfen. Die OCSP-Response darf 12 Stunden zwischengespeichert werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-197" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Verordnungsdatensatz übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das E-Rezept-Bundle vom Profil KBV_PR_ERP_Bundle ohne die Signatur zur im URL-Parameter "task=..." übertragenen Task-ID identifizieren und zur ChargeItem-Ressource mit dem Identifier PrescriptionID speichern und in ChargeItem.supportingInformation:prescriptionItem die Referenz hinzufügen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-198" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Quittung übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das Quittung-Bundle vom Profil GEM_ERP_PR_Bundle ohne die Signatur zur im URL-Parameter "task=..." übertragenen Task-ID identifizieren und zur ChargeItem-Ressource mit dem Identifier PrescriptionID speichern und in ChargeItem.supportingInformation:receipt die Referenz hinzufügen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-199" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Generierung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem eine 256-Bit-Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden ChargeItem als externe ID in ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode hinzufügen, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-200" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – ChargeItem befüllen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Erzeugen eines ChargeItem mittels HTTP-POST-Operation die folgenden Elemente schreiben: ChargeItem.enteredDate (aktueller Zeitstempel).
</requirement>

## PATCH /ChargeItem/<id> (Markierungen)

### Nachricht
Versicherte können Markierungen am ChargeItem (z. B. für Einreichung) ändern.

### Auslösung
Der Anwendungsfall wird im FdV/AdV ausgelöst, wenn Markierungen angepasst werden.

### Resource API

<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="ChargeItem"
  data-api-fhir-interaction="patch"
  data-api-operation-id="patchChargeItem">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Verarbeitung

<requirement conformance="SHALL" key="IG-ERP-CHRG-181" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – alles Ändern verbieten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation PATCH auf den Endpunkt /ChargeItem ohne Angabe einer <id> für eine konkrete Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Ändern mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-182" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-PATCH-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-183" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – Versicherter – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation ändert.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-184" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – Zulässige Felder" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die im HTTP-PATCH-Operation auf die Ressource ChargeItem übertragenen Attribute gegen das FHIR-Profil ChargeItem prüfen, auf die Zulässigkeit der änderbaren Felder prüfen: Versicherter darf nur Markierungen (extension ChargeItem.extension:markingFlag) ändern, und bei fehlerhafter Prüfung die Operation mit dem http-Status-Code 400 und einem Hinweis auf unzulässige Änderung gesperrter Attribute in OperationOutcome abbrechen, damit kein Schadcode und keine fachfremden Daten in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

## PUT /ChargeItem/<id> (Ändern PKV‑Abgabedatensatz)

### Nachricht
Die abgebende LEI überschreibt den PKV‑Abgabedatensatz eines ChargeItems. Dafür sind Prescription‑ID und AccessCode erforderlich.

**Beispiel-URI:** `https://prescriptionserver.telematik/ChargeItem/200.000.001.944.091.20?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea`

### Auslösung
Der Anwendungsfall wird ausgelöst, wenn Korrekturen an Abgabedaten notwendig sind.

### Resource API
<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="ChargeItem"
  data-api-fhir-interaction="update"
  data-api-operation-id="updateChargeItem">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Verarbeitung

<requirement conformance="SHALL" key="IG-ERP-CHRG-201" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Nutzer in den Rollen oid_oeffentliche_apotheke oder oid_krankenhausapotheke die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-202" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Prüfung Einwilligung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass zu der in ChargeItem.subject.identifier übermittelten KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = CHARGCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur eine Abrechnungsinformation für Versicherte gespeichert wird, die eine Einwilligung erteilt haben.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-203" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke), diese anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.enterer.identifier hinterlegte Telematik-ID prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die Apotheke, welche die Abrechnungsinformation bereitgestellt hat, diese ändert.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-204" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke) den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCodeChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-205" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – PKV-Abgabedatensatz übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI den im containedBinary übermittelten PKV-Abgabedatensatz herauslösen und entfernen, die Ressource zur ChargeItem-Ressource speichern und in ChargeItem.supportingInformation:dispenseItem die Referenz hinzufügen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-206" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – FHIR-Validierung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene PKV-Abgabedatensatz-Ressource gegen das FHIR-Profil PKV-Abgabedatensatz prüfen und bei Nicht-Konformität das Anlegen der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 und einem Hinweis auf die FHIR-Invalidität in OperationOutcome ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-207" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Signaturprüfung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI die Signatur des PKV-Abgabedatensatzes gemäß ETSI_QES prüfen und bei fehlender oder nicht gültiger Signatur mit Status 400 und einem Hinweis auf die ungültige Signatur in OperationOutcome abbrechen, um ausschließlich authentische Daten zu verwalten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-208" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung Signaturzertifikat PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI das Signaturzertifikat des PKV-Abgabedatensatzes prüfen. Das Signaturzertifikat muss anhand der Zertifikatsprüfung für mathematisch gültig, zeitlich gültig und online gültig befunden werden und der Aufruf anderenfalls mit Status 400 und einem Hinweis auf das abgelaufene/gesperrte Signaturzertifikat in OperationOutcome abgebrochen werden, um ausschließlich authentische Daten zu verwalten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-209" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – FHIR-Validierung ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene ChargeItem-Ressource gegen das FHIR-Profil ChargeItem prüfen, auf die Zulässigkeit der änderbaren Felder prüfen: abgebende LEI darf nur PKV-Abgabedatensatz ändern, und bei fehlerhafter Prüfung die Operation mit dem http-Status-Code 400 und einem Hinweis auf unzulässige Änderung gesperrter Attribute in OperationOutcome abbrechen, damit kein Schadcode und keine fachfremden Daten in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-210" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Generierung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI eine 256-Bit-Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden ChargeItem als externe ID in ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode überschreiben, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

## DELETE /ChargeItem/<id>

### Nachricht
Versicherte können Abrechnungsinformationen löschen. Dabei werden auch die referenzierten Datensätze gelöscht.

### Auslösung
Der Anwendungsfall wird durch den Versicherten im FdV/AdV ausgelöst.

### Resource API
<div class="gematik-apidoc"
  data-api-type="FHIRResource"
  data-api-fhir-resource-type="ChargeItem"
  data-api-fhir-interaction="delete"
  data-api-operation-id="deleteChargeItem">
  <div id="CapabilityStatement">
    <pre>
      {% include CapabilityStatement-erp-fachdienst-server-erpchrg.json %}
    </pre>
  </div>
</div>

### Verarbeitung

<requirement conformance="SHALL" key="IG-ERP-CHRG-166" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – alles Löschen verbieten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS den Aufruf der Operation DELETE /ChargeItem ohne Angabe einer konkreten über <id> adressierte ChargeItem Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-167" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte gelöscht werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-168" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation löscht.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-169" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – zu löschende Ressourcen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Löschen einer ChargeItem-Ressource auch die in ChargeItem.supportingInformation referenzierten Ressource des Verordnungsdatensatzes, des PKV-Abgabedatensatzes und der Quittung löschen.
</requirement>

## Sicherheitsanforderungen
Generelle Sicherheitsanforderungen werden [hier](./menu-schnittstellen-datenschutz-und-sicherheit.html) festgehalten.
