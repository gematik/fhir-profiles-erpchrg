Übersicht der fachlichen Anwendungsfälle im PKV‑Szenario.

{% assign use_cases = site.data['use-cases'] %}
{% assign roles = site.data['roles'] %}

Die folgenden fachlichen Anwendungsfälle beschreiben – aus Sicht der beteiligten Rollen – die Schritte zur Bereitstellung und Nutzung der Abrechnungsinformation.

#### Übergreifende Vorbedingungen

- Der Versicherte ist als PKV-Versicherter identifiziert.
- Die beteiligten Systeme sind gegenüber der TI authentisiert.

{% for use_case in use_cases %}

<a id="{{ use_case.anchor }}"></a>
#### {{ use_case.title }}

{% include use-case-details-table.html use_case=use_case roles=roles %}

{% endfor %}
