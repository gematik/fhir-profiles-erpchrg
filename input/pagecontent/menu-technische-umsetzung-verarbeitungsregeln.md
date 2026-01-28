Verarbeitungsregeln für den E-Rezept-Fachdienst

## Löschfristen
Für die Löschfristen des E-Rezepts gelten für Flowtype 200 und 209 die Vorgaben von Flowtype 160.

<requirement conformance="SHALL" key="IG-ERP-CHRG-283" title="E-Rezept-Fachdienst – Löschfrist ChargeItem" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS ein ChargeItem innerhalb eines Monats nach Ablauf von 10 Jahren nach dem Erstellen der Ressource automatisch löschen und das Löschen in einem AuditEvent für den Versicherten nachvollziehbar protokollieren, damit nicht mehr benötigte Informationen gelöscht sind. Der E-Rezept-Fachdienst MUSS bei jedem Löschen eines ChargeItems alle referenzierten Bundles (E-Rezept-Bundle, Quittungs-Bundle, PKV-Abgabedatensatz) ebenfalls löschen, damit die Informationen rund um ein gelöschtes ChargeItem ebenfalls entfernt werden.
</requirement>

## Protokollierung

<requirement conformance="SHALL" key="IG-ERP-CHRG-284" title="E-Rezept-Fachdienst – Versichertenprotokoll zu Operationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS jeden Aufruf der folgenden Operationen protokollieren und die gelesene bzw. geschriebene Ressource im Protokolleintrag AuditEvent.entity.what als Referenz hinzufügen sowie die KVNR des betroffenen Versicherten in AuditEvent.entity.name speichern, damit der Versicherte Zugriffe nachvollziehen und bei unberechtigten Zugriffen intervenieren kann.
</requirement>
