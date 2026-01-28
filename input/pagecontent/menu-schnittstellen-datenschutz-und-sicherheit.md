Datenschutz und Sicherheit

PKV-Versicherte erhalten Abrechnungsinformationen, die sie bei ihrer privaten Krankenversicherung zur Kostenerstattung einreichen. Der PKV-Abgabedatensatz wird nur gespeichert, wenn eine einmalige Einwilligung des Versicherten vorliegt. Die Abrechnungsinformationen werden bis zu 10 Jahre gespeichert und können anschließend durch den Versicherten abgerufen, weitergeleitet oder ausgedruckt werden.

Um zu vermeiden, dass der Anbieter des E-Rezept-Fachdienstes ein Profil über alle PKV-Versicherten mit Einwilligung erhält, wird die Information über die Einwilligung in der VAU verarbeitet und verschlüsselt gespeichert. Die Nichtabstreitbarkeit der Einwilligung ist technisch sicherzustellen.

<requirement conformance="SHALL" key="IG-ERP-CHRG-229" title="Einwilligung in Verarbeitung von Abrechnungsinformationen nur für PKV-Versicherte" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Die Fachanwendung E-Rezept MUSS sicherstellen, dass eine Einwilligung in die Verarbeitung von Abrechnungsinformationen nur für PKV-Versicherte möglich ist.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-230" title="Verarbeitung von Abrechnungsinformationen nur nach Einwilligung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Die Fachanwendung E-Rezept MUSS sicherstellen, dass eine Verarbeitung von Abrechnungsinformationen nur für PKV-Versicherte erfolgt, die hierfür eingewilligt haben.
</requirement>

<requirement conformance="SHALL NOT" key="IG-ERP-CHRG-231" title="Verarbeitung von Abrechnungsinformationen im E-Rezept-Fachdienst nur nach Einwilligung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst DARF NICHT Abrechnungsinformationen verarbeiten, wenn keine Einwilligung des PKV-Versicherten erfolgt ist.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-232" title="Nichtabstreitbarkeit der Einwilligung" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Die Fachanwendung E-Rezept MUSS sicherstellen, dass die technische Umsetzung der Einwilligung im E-Rezept-FdV und des Vermerkens dieser im E-Rezept-Fachdienst so zuverlässig ist, dass der Vermerk im E-Rezept-Fachdienst als nicht abstreitbar angesehen werden kann.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-233" title="Löschen von Abrechnungsinformationen nach zehn Jahren" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS Abrechnungsinformationen zu einem E-Rezept nach zehn Jahren löschen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-234" title="Information über Möglichkeit des Speicherns der Abrechnungsinformationen nur für konkretes E-Rezept" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS sicherstellen, dass abgebende Leistungserbringer die Information über die Möglichkeit des Speicherns der Abrechnungsinformationen im E-Rezept-Fachdienst nur im Kontext eines konkreten E-Rezepts erhalten.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-235" title="Schutz der Abrechnungsinformationen" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die Abrechnungsinformationen während der Verarbeitung (inkl. Transport und Speichern) vor unberechtigter Einsichtnahme oder Manipulation schützen.
</requirement>

<requirement conformance="SHALL" key="IG-ERP-CHRG-236" title="Protokollierung der Einwilligung bzw. des Widerrufs" version="0">
    <meta lockversion="false"/>
    <actor name="E-Rezept-Fachdienst">
        <testProcedure id="Produkttest"/>
    </actor>
Der E-Rezept-Fachdienst MUSS die Einwilligung in das Speichern der Abrechnungsinformationen und deren Widerruf – inkl. Zeitpunkt der Aktion – für den Versicherten protokollieren.
</requirement>
