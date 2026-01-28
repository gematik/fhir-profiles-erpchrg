Systemüberblick

## Einordnung in die Telematikinfrastruktur
Die Einführung des E-Rezepts für PKV-Versicherte setzt auf die bestehende Infrastruktur auf. PKV-Versicherte sind eine neue Benutzergruppe. Die App des Kostenträgers ist eine neue Komponente, zu der das E-Rezept-Frontend des Versicherten eine Schnittstelle für Abrechnungsinformationen anbietet. Die App des Kostenträgers ist keine Komponente der TI. Der Export als PDF ermöglicht weitere Übermittlungskanäle (z. B. E-Mail, Webportal).

## Fachliches Konzept
Die digitale Abrechnungsinformation besteht aus Verordnungsdatensatz, PKV-Abgabedatensatz und Quittungsdatensatz. Der Verordnungsdatensatz wird durch den Arzt/Zahnarzt erstellt und mit QES signiert. Für den Abrechnungsprozess wird er ohne QES übermittelt und durch den E-Rezept-Fachdienst fortgeschritten signiert.

Der PKV-Abgabedatensatz wird durch die Apotheke erstellt. Er enthält einen QES-signierten PKV-Abgabedatensatz oder eine fortgeschrittene Signatur. Die Quittung wird durch den E-Rezept-Fachdienst erstellt und fortgeschritten signiert. Sie dient als Nachweis der einmaligen Abgabe über die TI.

Die Abrechnungsinformationen werden bis zu 10 Jahre vorgehalten (Rechtsgrundlage § 360 Abs. 13 SGB V) und können vorher gelöscht werden. Eine Langzeitarchivierung im E-Rezept-Fachdienst ist nicht vorgesehen; stattdessen kann z. B. die ePA genutzt werden.

## Technisches Konzept (Kurzüberblick)
Für PKV-Versicherte werden die Workflow-Typen 200 und 209 eingeführt. Sie verwenden dasselbe Informationsmodell für den Verordnungsdatensatz wie GKV-Workflows. Der Workflow-Typ 200 ist identisch zu 160, der Workflow-Typ 209 zu 169. Für E-Rezepte der Workflow-Typen 200/209 können Abrechnungsinformationen über den E-Rezept-Fachdienst an den Versicherten übermittelt werden.

### Identifikation von PKV-Versicherten
Die Zuordnung erfolgt auf Basis der Versicherten-ID (10-stelliger unveränderlicher Teil der KVNR). An der Versicherten-ID ist nicht erkennbar, ob eine PKV-Versicherung vorliegt. Die Authentisierung erfolgt mittels ACCESS_TOKEN, ausgestellt von registrierten IdPs.
