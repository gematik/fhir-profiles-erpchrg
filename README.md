# E-Rezept-Workflow FHIR-Profiles for ChargeItem

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)
- [License](#license)
- [Additional Notes and Disclaimer from gematik GmbH](#additional-notes-and-disclaimer-from-gematik-gmbh)

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

## License

Copyright 2022-2025 gematik GmbH

Apache License, Version 2.0

See the [LICENSE](./LICENSE) for the specific language governing permissions and limitations under the License

## Additional Notes and Disclaimer from gematik GmbH

1. Copyright notice: Each published work result is accompanied by an explicit statement of the license conditions for use. These are regularly typical conditions in connection with open source or free software. Programs described/provided/linked here are free software, unless otherwise stated.
2. Permission notice: Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
    1. The copyright notice (Item 1) and the permission notice (Item 2) shall be included in all copies or substantial portions of the Software.
    2. The software is provided "as is" without warranty of any kind, either express or implied, including, but not limited to, the warranties of fitness for a particular purpose, merchantability, and/or non-infringement. The authors or copyright holders shall not be liable in any manner whatsoever for any damages or other claims arising from, out of or in connection with the software or the use or other dealings with the software, whether in an action of contract, tort, or otherwise.
    3. We take open source license compliance very seriously. We are always striving to achieve compliance at all times and to improve our processes. If you find any issues or have any suggestions or comments, or if you see any other ways in which we can improve, please reach out to: ospo@gematik.de
3. Please note: Parts of this code may have been generated using AI-supported technology. Please take this into account, especially when troubleshooting, for security analyses and possible adjustments.
