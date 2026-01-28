Diese Seite beschreibt die technischen Anwendungsfälle des Szenarios „E‑Rezepte für PKV‑Versicherte“. Im Fokus steht, was im E‑Rezept‑Fachdienst und in den beteiligten Clients (FdV/AdV, Primärsysteme, AVS) passiert, wenn die fachlichen Anwendungsfälle ausgeführt werden.

<a id="bereitstellen-abgebende-lei"></a>
## Bereitstellen der Abrechnungsinformation durch die abgebende LEI (AF_10082)
Die abgebende LEI stellt die Abrechnungsinformation zu einem E‑Rezept im E‑Rezept‑Fachdienst bereit. Technisch wird dafür ein ChargeItem mit eingebettetem PKV‑Abgabedatensatz angelegt, ergänzt um Verordnungsdatensatz und Quittung aus dem Workflow.

- Das AVS erstellt den PKV‑Abgabedatensatz (QES‑signiert bei Änderungen, andernfalls fortgeschritten signiert).
- Das AVS sendet den ChargeItem‑Datensatz an den E‑Rezept‑Fachdienst.
- Der E‑Rezept‑Fachdienst validiert den ChargeItem, prüft Einwilligung (Consent) und Signaturen.
- Der E‑Rezept‑Fachdienst erzeugt einen AccessCode und speichert die Abrechnungsinformation.

<em>Schnittstelle:</em> <i><a href="./query-api-chargeitem.html">query-api-chargeitem</a></i>

**Sequenzdiagramm (Platzhalter):**

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-abrechnungsinformation-bereitstellen.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>abrechnungsinformation-bereitstellen</figcaption>
</figure>

<a id="abrufen-abgebende-lei"></a>
## Abrufen der Abrechnungsinformation durch die abgebende LEI (AF_10081)
Für Korrekturen kann die abgebende LEI eine zuvor bereitgestellte Abrechnungsinformation abrufen. Voraussetzung ist die Prescription‑ID und der AccessCode.

- Das AVS ruft die Abrechnungsinformation im E‑Rezept‑Fachdienst ab.
- Der E‑Rezept‑Fachdienst prüft die Rolle, die Prescription‑ID und den AccessCode.
- Der E‑Rezept‑Fachdienst liefert das ChargeItem inkl. PKV‑Abgabedatensatz zurück.

<em>Schnittstelle:</em> <i><a href="./query-api-chargeitem.html">query-api-chargeitem</a></i>

**Sequenzdiagramm:**

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-abrechnungsinformation-abrufen-abgebender.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>abrechnungsinformation-abrufen-abgebender</figcaption>
</figure>

<br>

<a id="pkv-abgabedatensatz-aendern"></a>
## Ändern des PKV‑Abgabedatensatzes durch die abgebende LEI (AF_10083)
Wenn eine Korrektur erforderlich ist, kann die abgebende LEI den PKV‑Abgabedatensatz überschreiben. Ältere Versionen werden nicht gespeichert.

- Der Versicherte berechtigt die abgebende LEI über den AccessCode.
- Das AVS sendet den geänderten PKV‑Abgabedatensatz an den E‑Rezept‑Fachdienst.
- Der E‑Rezept‑Fachdienst validiert den Datensatz, überschreibt die gespeicherten Daten und erzeugt einen neuen AccessCode.

<em>Schnittstelle:</em> <i><a href="./query-api-chargeitem.html">query-api-chargeitem</a></i>

**Sequenzdiagramm (Platzhalter):**

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-abrechnungsinformation-aendern.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>abrechnungsinformation-aendern</figcaption>
</figure>

<a id="einwilligung-erteilen"></a>
## Einwilligung zum Speichern erteilen (AF_10084)
Der Versicherte erteilt die Einwilligung zum Speichern der Abrechnungsinformationen im E‑Rezept‑Fachdienst.

- Das FdV/AdV zeigt den Einwilligungstext an und holt die Bestätigung ein.
- Das FdV/AdV erstellt eine Consent‑Ressource (CHARGCONS) und speichert sie im E‑Rezept‑Fachdienst.

<em>Schnittstelle:</em> <i><a href="./query-api-consent.html">query-api-consent</a></i>

**Sequenzdiagramm (Platzhalter):**

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-einwilligung-erteilen.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>einwilligung-erteilen</figcaption>
</figure>

<a id="einwilligung-einsehen"></a>
## Einwilligung einsehen (AF_10086)
Der Versicherte kann prüfen, ob eine Einwilligung vorliegt.

- Das FdV/AdV ruft die Consent‑Information im E‑Rezept‑Fachdienst ab.
- Der E‑Rezept‑Fachdienst liefert die Consent‑Ressource zurück; das FdV/AdV zeigt den Status an.

<em>Schnittstelle:</em> <i><a href="./query-api-consent.html">query-api-consent</a></i>

**Sequenzdiagramm (Platzhalter):**

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-einwilligung-einsehen.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>einwilligung-einsehen</figcaption>
</figure>

<a id="einwilligung-widerrufen"></a>
## Einwilligung widerrufen (AF_10085)
Der Versicherte kann die Einwilligung jederzeit widerrufen. Mit dem Widerruf werden alle gespeicherten Abrechnungsinformationen gelöscht.

- Das FdV/AdV lässt den Widerruf bestätigen und übermittelt die Löschanforderung.
- Der E‑Rezept‑Fachdienst löscht die Consent‑Ressource und alle zugehörigen Abrechnungsinformationen.

<em>Schnittstelle:</em> <i><a href="./query-api-consent.html">query-api-consent</a></i>

**Sequenzdiagramm (Platzhalter):**

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-einwilligung-widerrufen.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>einwilligung-widerrufen</figcaption>
</figure>

<a id="abrechnungsinformation-abrufen-versicherter"></a>
## Abrechnungsinformation abrufen (AF_10087)
Der Versicherte ruft eine Liste und die Details seiner Abrechnungsinformationen im FdV/AdV ab.

- Das FdV/AdV ruft die Liste der ChargeItems ab.
- Für den Detailabruf fordert das FdV/AdV die Datensätze zu einer Prescription‑ID an.
- Der E‑Rezept‑Fachdienst signiert die Datensätze beim Abruf mit seinem Signaturzertifikat (C.FD.OSIG) und liefert sie zurück.
- Die Abrechnungsinformationen stehen zur Anzeige und für Export/Weitergabe bereit.

<em>Schnittstelle:</em> <i><a href="./query-api-chargeitem.html">query-api-chargeitem</a></i>

**Sequenzdiagramm (Platzhalter):**

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-abrechnungsinformation-abrufen-versicherter.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>abrechnungsinformation-abrufen-versicherter</figcaption>
</figure>

<a id="abrechnungsinformation-weitergeben"></a>
## Abrechnungsinformation weitergeben (AF_10088)
Der Versicherte gibt die Abrechnungsinformation aus dem FdV/AdV heraus an eine Ziel‑App weiter (z. B. PKV‑App, Beihilfe) oder exportiert sie als PDF/A.

- Das FdV/AdV erstellt ein PDF/A mit den relevanten Datensätzen.
- Das FdV/AdV übergibt das Dokument an die Ziel‑App oder ermöglicht Download/Versand.

<em>Schnittstelle:</em> <i><a href="./query-api-chargeitem.html">query-api-chargeitem</a></i>

**Sequenzdiagramm (Platzhalter):**

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-abrechnungsinformation-weitergeben.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>abrechnungsinformation-weitergeben</figcaption>
</figure>

<a id="abrechnungsinformation-markieren"></a>
## Abrechnungsinformation markieren
Der Versicherte kann Abrechnungsinformationen im FdV/AdV markieren (z. B. für Abrechnung, Beihilfe, Finanzamt). Die Markierungen werden im E‑Rezept‑Fachdienst gespeichert.

- Das FdV/AdV setzt die Markierung und speichert sie am ChargeItem.

<em>Schnittstelle:</em> <i><a href="./query-api-chargeitem.html">query-api-chargeitem</a></i>

**Sequenzdiagramm (Platzhalter):**

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-abrechnungsinformation-markieren.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>abrechnungsinformation-markieren</figcaption>
</figure>

<a id="abrechnungsinformation-loeschen"></a>
## Abrechnungsinformation löschen
Der Versicherte kann eine Abrechnungsinformation aktiv löschen. Die Löschung ist unwiederbringlich.

- Das FdV/AdV sendet die Löschanforderung für das ChargeItem.
- Der E‑Rezept‑Fachdienst löscht die Abrechnungsinformation und protokolliert den Vorgang.

<em>Schnittstelle:</em> <i><a href="./query-api-chargeitem.html">query-api-chargeitem</a></i>

**Sequenzdiagramm (Platzhalter):**

<figure>
    <div class="gem-ig-img-container" style="--box-width: 700px; margin-bottom: 30px;">
{% include seq-abrechnungsinformation-loeschen.svg %}
    </div>
    <figcaption><strong>Abbildung: </strong>abrechnungsinformation-loeschen</figcaption>
</figure>

<a id="accesscode-an-apotheke-uebermitteln"></a>
## Berechtigen der Apotheke zum Ändern des PKV‑Abgabedatensatzes
Der Versicherte übermittelt der abgebenden LEI einen AccessCode, um die Apotheke zum Abruf und einmaligen Ändern zu berechtigen.

- Das FdV/AdV erzeugt einen Abrechnungsinformation‑Token.
- Der Versicherte übermittelt den Token per Nachricht (Communication) oder zeigt einen 2D‑Code.
- Das AVS nutzt den AccessCode für Abruf/Änderung der Abrechnungsinformation.

<em>Schnittstelle:</em> <i><a href="./query-api-communication.html">query-api-communication</a></i>

**Sequenzdiagramm (Platzhalter):**
<!-- TODO: SD AccessCode an Apotheke übermitteln -->
