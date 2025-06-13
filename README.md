# E-Rezept-Workflow FHIR-Profiles for ChargeItem

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)

## About <a name = "about"></a>

This Repo contains the fsh files to the published E-Rezept charge item files on https://simplifier.net/erezept-abrechnungsinformationen and a script to validate them.

## Getting Started <a name = "getting_started"></a>

1. Clone this project to your local machine.
2. Install Sushi.
3. Run the sushi command to build the resource.

### Installing

To install Sushi:

```bash
npm i -g fsh-sushi
```

This will install:

- Sushi from <https://github.com/FHIR/sushi>

### Building the resources

After successfull installation run to build the resources:

```bash
sushi ./Resources
```
