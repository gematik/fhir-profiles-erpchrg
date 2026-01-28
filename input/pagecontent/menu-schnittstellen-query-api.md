Query API

Dieses Kapitel beschreibt die Schnittstellen des E-Rezept-Fachdienstes für die PKV-Abrechnung (Flowtype 200/209). Anforderungen sind in Requirement-Blöcken formuliert.

## Task
### POST /Task/<id>/$accept
<requirement conformance="SHALL" key="IG-ERP-CHRG-285" title="E-Rezept-Fachdienst – Task akzeptieren – Flowtype 200/209 – Einwilligung ermitteln" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$accept, wenn für die KVNR des begünstigten Versicherten (Task.for) eine Consent Ressource mit Consent.patient.identifier = KVNR und Consent.category.coding.code = "CHARGCONS" existiert, das Response Bundle um die Consent Ressource ergänzen, um der abgebenden LEI die Information zu übermitteln, ob der Versicherte eine Einwilligung zum Speichern der Abrechnungsinformationen auf dem E-Rezept-Fachdienst erteilt hat.
</requirement>

### POST /Task/<id>/$activate
<requirement conformance="SHALL" key="IG-ERP-CHRG-286" title="E-Rezept-Fachdienst – Task aktivieren – Flowtype 200/209 – Prüfung Coverage Type" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Zugriff auf einen Task des Flowtype Task.extension:flowType = 200 oder 209 mittels HTTP-POST-Operation über /Task/<id>/$activate prüfen, ob Coverage.type.coding.code mit dem Wert "PKV" belegt ist und im Fehlerfall die Operation mit Http-Fehlercode 400 abbrechen, um sicherzustellen, dass diese Workflows nur für E-Rezepte für PKV-Versicherte genutzt werden.
</requirement>

## ChargeItem
<requirement conformance="SHALL" key="IG-ERP-CHRG-287" title="E-Rezept-Fachdienst – ChargeItem – unzulässige Operationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource ChargeItem mittels der HTTP-Operationen HEAD unterbinden, damit keine unzulässigen Operationen auf die Informationen zu Abrechnungsinformationen ausgeführt werden können.
</requirement>

### DELETE /ChargeItem/<id>
<requirement conformance="SHALL" key="IG-ERP-CHRG-288" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – alles Löschen verbieten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS den Aufruf der Operation DELETE /ChargeItem ohne Angabe einer konkreten über <id> adressierte ChargeItem Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-289" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte gelöscht werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-290" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-DELETE-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation löscht.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-291" title="E-Rezept-Fachdienst – Abrechnungsinformation löschen – zu löschende Ressourcen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Löschen einer ChargeItem-Ressource auch die in ChargeItem.supportingInformation referenzierten Ressource des Verordnungsdatensatzes, des PKV-Abgabedatensatzes und der Quittung löschen.
</requirement>

### GET /ChargeItem
<requirement conformance="SHALL" key="IG-ERP-CHRG-292" title="E-Rezept-Fachdienst – Abrechnungsinformationen abrufen – Rollenprüfung Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-293" title="E-Rezept-Fachdienst – Abrechnungsinformationen abrufen – Versicherter – Filter KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und die ChargeItems danach filtern, damit der Versicherte nur Abrechnungsinformationen abruft, bei denen er der Begünstigte ist.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-294" title="E-Rezept-Fachdienst – Abrechnungsinformationen abrufen – Suchkriterien" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS das Eingrenzen einer Suchanfrage auf /ChargeItem über die URL-Parameter gemäß https://www.hl7.org/fhir/chargeitem.html#search mindestens für die Attribute ChargeItem.enteredDate und ChargeItem.meta.__lastUpdated erlauben, damit Versicherte und Apotheken eine Suche nach neuen Abrechnungsinformationseinträgen durchführen können.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-295" title="E-Rezept-Fachdienst – Abrechnungsinformationen abrufen – Response" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem eine Liste von ChargeItem Ressourcen ohne die in supportingInformation referenzierten Datensätze entsprechend der Filterung und Suchkriterien übermitteln.
</requirement>

<requirement conformance="MAY" key="IG-ERP-CHRG-296" title="E-Rezept-Fachdienst – Abrechnungsinformationen abrufen – Paging" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst KANN beim Aufruf der HTTP-GET-Operation auf den Endpunkt /ChargeItem das Suchergebnis in einem Paging-Mechanismus auf mehrere Ergebnis-Bundle aufteilen, damit der Nutzer eine komfortable Navigationsmöglichkeit in seinen Abrechnungsinformationen erhält.
</requirement>

### GET /ChargeItem/<id>
<requirement conformance="SHALL" key="IG-ERP-CHRG-297" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Rollenprüfung Versicherter oder Apotheker" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Versicherte oder Apotheken in den Rollen oid_versicherter, oid_oeffentliche_apotheke oder oid_krankenhausapotheke die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit E-Rezepte nicht durch Unberechtigte ausgelesen werden können.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-298" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Versicherter – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation abrufen kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-299" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – Prüfung Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution, die LEI anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die in ChargeItem.enterer.identifier hinterlegte Telematik-ID der einstellenden LEI prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die LEI eine Abrechnungsinformation abrufen kann, welche die Abrechnungsinformation bereitgestellt hat.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-300" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – Prüfung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution, den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCodeChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-301" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Versicherte – Signieren" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Operation GET /ChargeItem/<id> durch einen Versicherten zusätzlich zum ChargeItem die folgenden Datensätze im JSON-Format in einem Responsebundle zurück liefern und dafür in jedem Aufruf den Verordnungsdatensatz, den PKV-Abgabedatensatz und die Quittung im XML-Format mit der Signaturidentität des E-Rezept-Fachdienstes gemäß RFC5652 im Profil CAdES-BES (Enveloping) signieren und in jede Fachdienstsignatur die letzte OCSP-Antwort der Statusprüfung des Signaturzertifikats C.FD.OSIG einbetten, damit der Versicherte die Daten für die Abrechnung an Kostenträger weiterleiten kann.
</requirement>

<requirement conformance="SHALL NOT" key="IG-ERP-CHRG-302" title="E-Rezept-Fachdienst – Abrechnungsinformation abrufen – Apotheke – kein AccessCode und Quittung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst DARF beim Aufruf der Operation GET /ChargeItem/<id> durch eine abgebende Leistungserbringerinstitution das in ChargeItem.supportingInformation referenzierte Element ChargeItem.supportingInformation:receipt und den Identifier Task.identifier:AccessCode NICHT in den Response übernehmen, sodass die abgebende LEI nur den Verordnungsdatensatz und den durch sie änderbaren PKV-Abgabedatensatz erhält.
</requirement>

### PATCH /ChargeItem/<id>
<requirement conformance="SHALL" key="IG-ERP-CHRG-303" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – alles Ändern verbieten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation PATCH auf den Endpunkt /ChargeItem ohne Angabe einer <id> für eine konkrete Ressource mit dem HTTP-Fehlercode 405 ablehnen, um das Ändern mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-304" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-PATCH-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Nutzer in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-305" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – Versicherter – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PATCH-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch einen Versicherten, den Versicherten anhand der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.subject.identifier hinterlegte KVNR des begünstigten Versicherten prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich der begünstigte Versicherte eine Abrechnungsinformation ändert.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-306" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern (PATCH) – Zulässige Felder" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die im HTTP-PATCH-Operation auf die Ressource ChargeItem übertragenen Attribute gegen das FHIR-Profil ChargeItem prüfen, auf die Zulässigkeit der änderbaren Felder prüfen: Versicherter darf nur Markierungen (extension ChargeItem.extension:markingFlag) ändern, und bei fehlerhafter Prüfung die Operation mit dem http-Status-Code 400 und einem Hinweis auf unzulässige Änderung gesperrter Attribute in OperationOutcome abbrechen, damit kein Schadcode und keine fachfremden Daten in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

### POST /ChargeItem
<requirement conformance="SHALL" key="IG-ERP-CHRG-307" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ausschließlich Nutzer in den Rollen oid_oeffentliche_apotheke oder oid_krankenhausapotheke die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte eingestellt werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-308" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Parameter Task" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass ein URL-Parameter "task=..." übermittelt wurde und bei Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 400 abbrechen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-309" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Existenz Task" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass zu der im URL-Parameter "task=..." übertragene Task-ID eine Task-Ressource mit dem Status Task.status = completed existiert und bei fehlgeschlagener Prüfung mit dem HTTP-Fehlercode 409 abbrechen, damit nur eine Abrechnungsinformation für E-Rezepte mit dem Status „quittiert“ angelegt wird.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-310" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Secret Task" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das im URL-Parameter "secret=..." übertragene Secret gegen das im referenzierten Task gespeicherte SecretTask.identifier:Secret als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit der Zugriff auf diesen Datensatz nur durch die berechtigten Apotheke in Kenntnis des Secrets erfolgt.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-311" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Flowtype Task" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass der im URL-Parameter "task=..." referenzierte Task den Flowtype Task.extension:flowType = 200 oder 209 besitzt und bei fehlgeschlagener Prüfung mit dem HTTP-Fehlercode 400 abbrechen, damit nur eine Abrechnungsinformation für E-Rezepte mit zulässigen Flowtype angelegt wird.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-312" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Einwilligung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem sicherstellen, dass zu der in ChargeItem.subject.identifier übermittelten KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = CHARGCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur eine Abrechnungsinformation für Versicherte gespeichert wird, die eine Einwilligung erteilt haben.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-313" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – FHIR-Validierung ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource ChargeItem übertragene ChargeItem-Ressource gegen das FHIR-Profil ChargeItem prüfen und die Korrektheit der Rezept-ID (GEM_ERP_PR_PrescriptionId) im referenzierten Task als ChargeItem.identifier, die Korrektheit der Versicherten-ID des Versicherten im referenzierten Task (Task.for) gegen ChargeItem.subject.identifier sowie die Korrektheit der Telematik-ID der Apotheke gemäß ACCESS_TOKEN mit dem Wert in ChargeItem.enterer.identifier prüfen und bei Nicht-Konformität das Anlegen der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-314" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – PKV-Abgabedatensatz übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem den im containedBinary übermittelten PKV-Abgabedatensatz herauslösen und entfernen, die Ressource zur ChargeItem-Ressource speichern und in ChargeItem.supportingInformation:dispenseItem die Referenz hinzufügen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-315" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – FHIR-Validierung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource ChargeItem übertragene PKV-Abgabedatensatz-Ressource gegen das FHIR-Profil DAV-PKV-PR-ERP-AbgabedatenBundle prüfen und bei Nicht-Konformität das Anlegen der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-316" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Signaturprüfung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem die Signatur des PKV-Abgabedatensatzes gemäß ETSI_QES prüfen und bei fehlender oder nicht gültiger Signatur mit Status 400 abbrechen, um ausschließlich authentische Daten zu verwalten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-317" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Prüfung Signaturzertifikat PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das Signaturzertifikat des PKV-Abgabedatensatzes prüfen. Das Signaturzertifikat muss anhand der Zertifikatsprüfung für mathematisch gültig, zeitlich gültig und online gültig befunden werden und der Aufruf anderenfalls mit Status 400 abgebrochen werden, um ausschließlich authentische Daten zu verwalten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-318" title="E-Rezept-Fachdienst – Signaturzertifikat SMC-B prüfen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS ein Signatur-Zertifikat einer nonQES-Signatur einer Leistungserbringerinstitution gemäß gemSpec_PKI#TUC_PKI_018 mit den Parametern oid_smc_b_osig, intendedKeyUsage nonRepudiation, intendedExtendedKeyUsage leer, OCSP-Graceperiod 12 Stunden, Offline-Modus nein, Prüfmodus OCSP auf Gültigkeit prüfen. Die OCSP-Response darf 12 Stunden zwischengespeichert werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-319" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Verordnungsdatensatz übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das E-Rezept-Bundle vom Profil KBV_PR_ERP_Bundle ohne die Signatur zur im URL-Parameter "task=..." übertragenen Task-ID identifizieren und zur ChargeItem-Ressource mit dem Identifier PrescriptionID speichern und in ChargeItem.supportingInformation:prescriptionItem die Referenz hinzufügen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-320" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Quittung übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem das Quittung-Bundle vom Profil GEM_ERP_PR_Bundle ohne die Signatur zur im URL-Parameter "task=..." übertragenen Task-ID identifizieren und zur ChargeItem-Ressource mit dem Identifier PrescriptionID speichern und in ChargeItem.supportingInformation:receipt die Referenz hinzufügen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-321" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – Generierung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-POST-Operation auf den Endpunkt /ChargeItem eine 256-Bit-Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden ChargeItem als externe ID in ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode hinzufügen, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-322" title="E-Rezept-Fachdienst – Abrechnungsinformation bereitstellen – ChargeItem befüllen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Erzeugen eines ChargeItem mittels HTTP-POST-Operation die folgenden Elemente schreiben: ChargeItem.enteredDate (aktueller Zeitstempel).
</requirement>

### PUT /ChargeItem/<id>
<requirement conformance="SHALL" key="IG-ERP-CHRG-323" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Rollenprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der Http-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass ausschließlich Nutzer in den Rollen oid_oeffentliche_apotheke oder oid_krankenhausapotheke die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Abrechnungsinformation nicht durch Unberechtigte aktualisiert werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-324" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Prüfung Einwilligung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource sicherstellen, dass zu der in ChargeItem.subject.identifier übermittelten KVNR ein Consent-Datensatz mit Consent.patient.identifier = KVNR und Consent.category.coding.code = CHARGCONS existiert und bei fehlgeschlagener Prüfung die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit nur eine Abrechnungsinformation für Versicherte gespeichert wird, die eine Einwilligung erteilt haben.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-325" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung Telematik-ID" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke), diese anhand der Telematik-ID aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren, diese gegen die im gespeicherten Datensatz in ChargeItem.enterer.identifier hinterlegte Telematik-ID prüfen und bei Ungleichheit den Aufruf mit dem HTTP-Fehlercode 403 abweisen, damit ausschließlich die Apotheke, welche die Abrechnungsinformation bereitgestellt hat, diese ändert.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-326" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende Leistungserbringerinstitution (Apotheke) den im URL-Parameter "?ac=..." übertragenen AccessCode gegen den im referenzierten ChargeItem gespeicherten AccessCodeChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode prüfen und bei Ungleichheit oder Fehlen des URL-Parameters die Operation mit dem HTTP-Fehlercode 403 abbrechen, damit Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-327" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – PKV-Abgabedatensatz übernehmen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI den im containedBinary übermittelten PKV-Abgabedatensatz herauslösen und entfernen, die Ressource zur ChargeItem-Ressource speichern und in ChargeItem.supportingInformation:dispenseItem die Referenz hinzufügen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-328" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – FHIR-Validierung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene PKV-Abgabedatensatz-Ressource gegen das FHIR-Profil PKV-Abgabedatensatz prüfen und bei Nicht-Konformität das Anlegen der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 und einem Hinweis auf die FHIR-Invalidität in OperationOutcome ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-329" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Signaturprüfung PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI die Signatur des PKV-Abgabedatensatzes gemäß ETSI_QES prüfen und bei fehlender oder nicht gültiger Signatur mit Status 400 und einem Hinweis auf die ungültige Signatur in OperationOutcome abbrechen, um ausschließlich authentische Daten zu verwalten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-330" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Prüfung Signaturzertifikat PKV-Abgabedatensatz" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI das Signaturzertifikat des PKV-Abgabedatensatzes prüfen. Das Signaturzertifikat muss anhand der Zertifikatsprüfung für mathematisch gültig, zeitlich gültig und online gültig befunden werden und der Aufruf anderenfalls mit Status 400 und einem Hinweis auf das abgelaufene/gesperrte Signaturzertifikat in OperationOutcome abgebrochen werden, um ausschließlich authentische Daten zu verwalten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-331" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – FHIR-Validierung ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die im HTTP-PUT-Operation auf die Ressource ChargeItem übertragene ChargeItem-Ressource gegen das FHIR-Profil ChargeItem prüfen, auf die Zulässigkeit der änderbaren Felder prüfen: abgebende LEI darf nur PKV-Abgabedatensatz ändern, und bei fehlerhafter Prüfung die Operation mit dem http-Status-Code 400 und einem Hinweis auf unzulässige Änderung gesperrter Attribute in OperationOutcome abbrechen, damit kein Schadcode und keine fachfremden Daten in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-332" title="E-Rezept-Fachdienst – Abrechnungsinformation ändern – Apotheke – Generierung AccessCode" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-PUT-Operation auf eine konkrete über <id> adressierte /ChargeItem/<id> Ressource durch eine abgebende LEI eine 256-Bit-Zufallszahl mit einer Mindestentropie von 120 Bit erzeugen, hexadezimal kodieren ([0-9a-f]{64}) und diese im zu speichernden ChargeItem als externe ID in ChargeItem.identifier:AccessCode als https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode überschreiben, damit nachfolgende Zugriffe auf diesen Datensatz nur durch Berechtigte in Kenntnis des AccessCodes erfolgen.
</requirement>

## Consent
<requirement conformance="SHALL" key="IG-ERP-CHRG-333" title="E-Rezept-Fachdienst – unzulässige Operationen Consent" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS alle Zugriffe auf die Ressource Consent mittels der HTTP-Operationen PUT, PATCH oder HEAD unterbinden, damit keine unzulässigen Operationen auf die Informationen zur Einwilligung ausgeführt werden können.
</requirement>

### DELETE /Consent
<requirement conformance="SHALL" key="IG-ERP-CHRG-334" title="E-Rezept-Fachdienst – Consent löschen – alles Löschen verbieten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent ohne Angabe ?category mit dem HTTP-Fehlercode 405 ablehnen, um das Löschen mehrerer Ressourcen über einen Request zu verhindern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-335" title="E-Rezept-Fachdienst – Consent löschen – Rollenprüfung Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen und sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen, damit die Information zur Einwilligung nicht durch Unberechtigte gelöscht werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-336" title="E-Rezept-Fachdienst – Consent löschen – Prüfung category" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent prüfen, dass der für ?category angegebene Wert im System https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType enthalten ist und bei fehlerhafter Prüfung den Request mit dem Fehler 400 abbrechen, damit nur Löschrequests für definierte Consent-Typen ausgeführt werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-337" title="E-Rezept-Fachdienst – Consent löschen – Löschen der bestehenden Abrechnungsinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent mit ?category=CHARGCONS alle dem Versicherten zugeordneten ChargeItem-Ressourcen (ChargeItem.subject.identifier) anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und löschen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-338" title="E-Rezept-Fachdienst – Consent löschen – Löschen der Consent" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-Operation DELETE auf den Endpunkt /Consent die Ressource löschen, bei der Consent.patient.identifier der KVNR aus dem ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests sowie Consent.category.coding.code dem in ?category übermittelten Wert entspricht.
</requirement>

### GET /Consent
<requirement conformance="SHALL" key="IG-ERP-CHRG-339" title="E-Rezept-Fachdienst – Consent lesen – Rollenprüfung Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit die Information zur Einwilligung nicht durch Unberechtigte ausgelesen werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-340" title="E-Rezept-Fachdienst – Consent lesen – Filter Consent auf KVNR des Versicherten" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-GET-Operation auf den Endpunkt /Consent die dem Versicherten zugeordneten Consent-Ressourcen anhand der KVNR des Versicherten im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests identifizieren und in den Response aufnehmen, die in Consent.patient.identifier die entsprechende KVNR des begünstigten Versicherten referenziert haben, damit ausschließlich Versicherte ihre eigenen Informationen zu Einwilligungen einsehen können.
</requirement>

### POST /Consent
<requirement conformance="SHALL" key="IG-ERP-CHRG-341" title="E-Rezept-Fachdienst – Consent schreiben – Rollenprüfung Versicherter" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass ausschließlich Versicherte in der Rolle oid_versicherter die Operation am E-Rezept-Fachdienst aufrufen dürfen und die Rolle "professionOID" des Aufrufers im ACCESS_TOKEN im HTTP-RequestHeader "Authorization" feststellen, damit eine Einwilligung nicht durch Unberechtigte erteilt werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-342" title="E-Rezept-Fachdienst – Consent schreiben – Prüfung KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass die KVNR im ACCESS_TOKEN im "Authorization"-Header des HTTP-Requests und die KVNR in Consent.patient.identifier übereinstimmen, damit eine Einwilligung für einen Versicherten nicht durch Dritte erteilt werden kann. Im Fehlerfall muss der Http-Request mit dem Http-Fehlercode 403 abgewiesen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-343" title="E-Rezept-Fachdienst – Consent schreiben – FHIR-Validierung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die im HTTP-POST-Operation auf die Ressource Consent übertragene Consent-Ressource gegen das FHIR-Profil Consent prüfen und bei Nicht-Konformität das Anlegen der Ressource im E-Rezept-Fachdienst mit dem http-Status-Code 400 ablehnen, damit nur FHIR-valide Ressourcen in den E-Rezept-Fachdienst hochgeladen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-344" title="E-Rezept-Fachdienst – Consent schreiben – nur eine Einwilligung CHARGCONS pro KVNR" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent sicherstellen, dass noch keine Consent-Ressource für die KVNR im ACCESS_TOKEN und Consent.category.coding.code = CHARGCONS gespeichert ist, um maximal eine Einwilligung für den Versicherten zu speichern. Im Fehlerfall muss der Http-Request mit dem Http-Fehlercode 409 abgewiesen werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-345" title="E-Rezept-Fachdienst – Consent schreiben – Persistieren" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Aufruf der HTTP-POST-Operation auf den Endpunkt /Consent – falls bei den Prüfungen keine Fehler aufgetreten sind, welche zum Abbruch der Operation führen – die übermittelte Ressource persistieren.
</requirement>

## Communication
### POST /Communication
<requirement conformance="SHALL" key="IG-ERP-CHRG-346" title="E-Rezept-Fachdienst – Nachricht einstellen – Schemaprüfung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht über die HTTP-Operation POST auf den Endpunkt /Communication die im HTTP-Request-Body übergebene Communication-Ressource gegen das aus der Kommunikationsbeziehung ableitbare zulässige Schema prüfen und den Aufruf bei Nicht-Konformität mit dem http-Status-Code 400 ablehnen, damit ausschließlich konforme E-Rezept-Nachrichten ausgetauscht werden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-347" title="E-Rezept-Fachdienst – Nachricht einstellen – Versicherte – Prüfung Versichertenbezug und Berechtigung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS das Einstellen einer Nachricht der Profile GEM_ERP_PR_Communication_DispReq, GEM_ERP_PR_Communication_InfoReq oder GEM_ERP_PR_Communication_Representative durch einen Versicherten über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn die KVNR des in Communication.basedOn referenzierten Tasks ungleich der KVNR des Einstellenden in "idNummer" des ACCESS_TOKEN ist und der HTTP-Header "X-AccessCode" fehlt oder ungleich dem AccessCode-Identifier des referenzierten Tasks ist, um irreführende Testnachrichten zu unterbinden.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-348" title="E-Rezept-Fachdienst – Nachricht einstellen – Prüfung Existenz Task" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERP_PR_Communication_DispReq, GEM_ERP_PR_Communication_InfoReq, GEM_ERP_PR_Communication_Reply oder GEM_ERP_PR_Communication_Representative über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen Task referenziert, der nicht existiert, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-349" title="E-Rezept-Fachdienst – Nachricht einstellen – Prüfung Existenz ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERPCHRG_PR_Communication_ChargChangeReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReply über die HTTP-Operation POST auf den Endpunkt /Communication mit dem http-Status-Code 400 abbrechen, wenn das Pflichtfeld Communication.basedOn einen ChargeItem referenziert, der nicht existiert, um Spam und nicht-rezeptbezogene Kommunikation zu verhindern.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-350" title="E-Rezept-Fachdienst – Nachricht einstellen – Notification Apotheke" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS beim Einstellen einer Nachricht der Profile GEM_ERP_PR_Communication_DispReq, GEM_ERP_PR_Communication_InfoReq oder GEM_ERPCHRG_PR_Communication_ChargChangeReq zur Versicherten-zu-Apotheken-Kommunikation über die HTTP-Operation POST auf den Endpunkt /Communication prüfen, ob für die Telematik-ID des Empfängers Subscriptions registriert sind und für Registrierungen über den Subscription Service eine Notification (ping : subscription-id) senden.
</requirement>
