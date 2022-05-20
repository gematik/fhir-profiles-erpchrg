# E-Rezept-Workflow FHIR-Profiles for ChargeItem

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)

## About <a name = "about"></a>

This Repo contains the fsh files to the published E-Rezept Worklow files on <https://simplifier.net/erezept-abrechnungsinformationen> and a script to validate them.

## Getting Started <a name = "getting_started"></a>

1. Clone this project to your local machine.
2. Run the install script once.
3. Work on teh FHIR Profiles build and validate them with the given script.

### Installing

To install the necessary tools with
```
sudo ./install_fhir_tools.sh
```
This will install
- Java SDK 17 JRE
- Sushi from <https://github.com/FHIR/sushi>
- dotnet-sdk-3.1
- firely.terminal
- yq yaml-parser

After successfull installation run:

```
./validate.sh -i
```

## Usage <a name = "usage"></a>

Run script `validate.sh` has the following options

- [-d foldername] sets foldername for validation. Default is: './Resources'
- [-f filename] sets filename for single validation. Example: ./Resources/fsh-generated/resources/myProfile.json
- [-i] installs dependencies with firely.terminal from './<foldername>/sushi-config.yaml' file