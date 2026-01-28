Generelle Prinzipien

## Authentisierung
Die Authentisierung der Nutzer am E-Rezept-Fachdienst erfolgt mittels ACCESS_TOKEN. Tokens werden von registrierten Identity Providern ausgestellt. Für die Authentisierung eines Versicherten am IdP der gematik wird eine eGK mit NFC-Schnittstelle verwendet; zukünftig können föderierte IdPs eingebunden werden.

## HTTP-Header
Die folgenden Operationen nutzen den HTTP-Header "X-erp-resource":

| Operation | X-erp-resource |
| --- | --- |
| DELETE /Consent/ | Consent |
| GET /Consent/ | Consent |
| POST /Consent/ | Consent |
| DELETE /ChargeItem/<id> | ChargeItem |
| GET /ChargeItem/ | ChargeItem |
| GET /ChargeItem/<id> | ChargeItem |
| PATCH /ChargeItem/<id> | ChargeItem |

Die Benutzerführung im E-Rezept-FdV muss die Funktionen für PKV-Versicherte zielgerichtet anbieten (z. B. durch Konfiguration als PKV-Versicherter).
