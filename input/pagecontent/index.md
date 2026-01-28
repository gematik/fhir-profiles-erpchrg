Dieser Implementation Guide beschreibt das Feature zur Übermittlung von ärztlichen und zahnärztlichen Verordnungen für apothekenpflichtige Arzneimittel für PKV-Versicherte und die Bereitstellung der Abrechnungsinformationen für den Kostenträger. Es umfasst die Definition der Prozessparameter, Ergänzungen der workflowspezifischen Anforderungen an die Schnittstellen des E-Rezept-Fachdienstes sowie die Darstellung der Use Cases für Leistungserbringer und Versicherte.

Die Fachanwendung E-Rezept ermöglicht die Übermittlung von ärztlichen bzw. zahnärztlichen Verordnungen in elektronischer Form. In der ersten Stufe sind dies Verordnungen für apothekenpflichtige Arzneimittel. In weiteren Ausbaustufen wird die Anwendung um weitere Verordnungen wie Betäubungsmittel (BtM), T-Rezepte sowie Heil- und Hilfsmittel erweitert.

Die erstellten FHIR Profile richten sich an die Implementierer und Nutzer der Schnittstellen der Fachanwendung E-Rezept. Die Profile bilden dabei das technische Grundgerüst der Informationsobjekte zur Umsetzung des Projektes E-Rezept. Sie stehen in Verbindung mit den von der KBV definierten fachlichen Informationsobjekten (https://simplifier.net/eRezept/~introduction). 

Für eine Übersicht der in diesem IG referenzierten Dokumente siehe [Referenzen](./referenced.html).

Das Repository, was diesem Projekt zugrundeliegt und auch die FSH-Files enthält findet sich hier: https://github.com/gematik/fhir-profiles-erpchrg

## Wie dieser IG zu lesen ist

Dieser Implementation Guide (IG) ist in mehrere Kapitel gegliedert siehe [Inhaltsverzeichnis](./toc.html).

//TODO: tbd...

Zuerst Szenarien und Anwendungsfälle, dann technische Umsetzung, Profile, Beispiele, Abhängigkeiten, Kontakt und rechtliche Hinweise.

### Abhängiger IG
Dieser FHIR-IG basiert auf dem FHIR-IG [gemIG_eRp_Prescription], welcher die Grundlage für die Implementierung des E-Rezept-Fachdienst und der Anwendungsfälle basiert. Alle dort beschriebenen Anforderungen und Datenmodelle gelten auch für diesen IG.

Schnittstellen und Spezifikationen, die in anderen Anwendungsfällen des E-Rezept-Fachdienst bereits beschrieben sind, werden hier nicht wiederholt. Entsprechende Anforderungen sind in [gemIG_eRp_Prescription] dokumentiert und werden aus diesem IG referenziert.

## Abhängigkeiten

{% include dependency-table.xhtml %}

## Kontakt und Feedback

Für Fragen und Feedback wenden Sie sich bitte an [erp-umsetzung@gematik.de](mailto:erp-umsetzung@gematik.de) oder nutzen Sie das [GitHub-Repository](https://github.com/gematik/fhir-profiles-erp/issues).

## Rechtliche Hinweise

Dieser IG wird von der [gematik GmbH](https://www.gematik.de/) erstellt und verwaltet.

Copyright ©2026+ gematik GmbH

HL7®, HEALTH LEVEL SEVEN®, FHIR® und das FHIR®-Logo sind Marken von Health Level Seven International, eingetragen beim United States Patent and Trademark Office.
