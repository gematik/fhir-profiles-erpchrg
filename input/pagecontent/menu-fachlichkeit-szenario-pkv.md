Dieses Szenario beschreibt den Prozess zur digitalen Bereitstellung von Abrechnungsinformationen für PKV-Versicherte. Es ergänzt den Standard-E-Rezept-Workflow um die Erstellung, Speicherung und Bereitstellung des PKV-Abgabedatensatzes.

## Prozessabschnitte

Die digitale Abrechnungsinformation besteht aus den folgenden Datensätzen:

- Verordnungsdatensatz
- PKV-Abgabedatensatz
- Quittungsdatensatz

### Verordnung
Die Verordnung erfolgt analog zu den bestehenden E-Rezept-Workflows. Für PKV-Versicherte werden die Flowtypes 200 und 209 genutzt. Der Verordnungsdatensatz basiert auf dem KBV-Modell [eRezept-Profile].

Der Verordnungsdatensatz wird durch den Arzt/Zahnarzt erstellt, mit einer Qualifizierten Elektronischen Signatur (QES) versehen und auf dem E-Rezept-Fachdienst eingestellt. Für den Abrechnungsprozess wird der Verordnungsdatensatz ohne QES übermittelt, um das Risiko von Mehrfacheinlösungen zu vermeiden. Statt der QES wird der Verordnungsdatensatz durch den E-Rezept-Fachdienst fortgeschritten signiert, um die Integrität des Datensatzes für den Abrechnungsprozess sicherzustellen.

### Belieferung durch die Apotheke
Nach der Einlösung kann die Apotheke die Abrechnungsinformation digital bereitstellen, sofern eine Einwilligung vorliegt.

Der PKV-Abgabedatensatz wird durch die Apotheke erstellt. Er enthält – sofern in der Apotheke Änderungen bei der Abgabe vorgenommen werden – den QES-signierten PKV-Abgabedatensatz; andernfalls den fortgeschritten signierten PKV-Abgabedatensatz. Das Informationsmodell zum PKV-Abgabedatensatz wird durch den Verband der PKVen und DAV erarbeitet.

Der E-Rezept-Fachdienst erzeugt einen AccessCode, der für spätere Korrekturen genutzt werden kann.

### Abrechnung durch den Versicherten
Der Versicherte ruft die Abrechnungsinformation im FdV ab, kann sie exportieren und an den Kostenträger weiterleiten. Der Export in Form eines PDFs ermöglicht hierbei verschiedene Kanäle zur Übermittlung (wie E-Mail, Webportal oder App des Kostenträgers).

Die Quittung wird durch den E-Rezept-Fachdienst erstellt und fortgeschritten signiert. Sie dient dem Versicherten bei der Abrechnung gegenüber dem Kostenträger als Nachweis, dass ein Arzneimittel auf ein E-Rezept einmalig über die TI abgegeben worden ist.

Der PKV-Versicherte hat die Möglichkeit, die Abrechnung in einem Zeitraum von bis zu 10 Jahren bei seiner Krankenversicherung vorzunehmen. Daher werden die Abrechnungsinformationen so lange für den Versicherten im E-Rezept-Fachdienst vorgehalten, bevor sie automatisch gelöscht werden (rechtliche Grundlage § 360 Abs. 13 SGB V). Der PKV-Versicherte hat außerdem die Möglichkeit, sie vorab (z. B. nach Abschluss der Abrechnung) zu löschen.

Eine Langzeitarchivierung der Abrechnungsinformation im E-Rezept-Fachdienst ist nicht vorgesehen. Hierfür kann der Versicherte beispielsweise die elektronische Patientenakte (ePA) nutzen.

Die Löschfristen für das E-Rezept mit den in Beziehung stehenden Daten, wie Dispensierinformationen und Kommunikationen zum E-Rezept, werden unabhängig von der zugehörigen Abrechnungsinformation durchgesetzt. Siehe [gemSysL_eRp#A_18525].

## Beteiligte Systeme
- Primärsysteme (PVS/KIS)
- E-Rezept-Fachdienst
- E-Rezept-FdV bzw. E-Rezept-AdV
- Apothekenverwaltungssystem (AVS)
- Kostenträger-Apps

## Fachliche Anwendungsfälle
{% assign use_cases = site.data['use-cases'] %}
{% assign roles = site.data['roles'] %}
{% assign scenario_use_cases = "AF_10082, AF_10081, AF_10083, AF_10084, AF_10085, AF_10086, AF_10087" | split: ", " %}

{% include use-case-overview.table.html use_cases=use_cases ids=scenario_use_cases roles=roles %}

