![bash_on_board](https://github.com/BobDotMe/bob/workflows/bash_on_board/badge.svg?branch=develop)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/BobDotMe/bob/bash_on_board)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/BobDotMe/bob?sort=semver)
![Docker Pulls](https://img.shields.io/docker/pulls/bobdotme/bob?label=docker%20pulls%20-%20container)
![Docker Pulls](https://img.shields.io/docker/pulls/bobdotme/bob-core?label=docker%20pulls%20-%20core)
![Docker Pulls](https://img.shields.io/docker/pulls/bobdotme/bob-proxy?label=docker%20pulls%20-%20proxy)
![Hex.pm](https://img.shields.io/hexpm/l/apa)
![Twitter Follow](https://img.shields.io/twitter/follow/BobDotMe?style=social)
<img alt="bob" align="left" src="docs/bob.png" width="25%" height="25%">
# What is Bash on board! (we like to call it BOB)?

BOB is an open source **general purpose container** for Kubernetes, providing the utilities, support tools and a framework, that allows a diverse set problems to be solved for pod initialization and support to natively integrate with cloud-native environments.

BOB turns a simple container instanciation into a power support tool for general troubleshooting, service rendering, and performance evaluation.  It does this by creating a core set services that house and manage the utilities as well as a super lightweight container to invoke in a pod.  

BOB integrates deeply into cloud native environments leveraging extension points and providing a seamless experience for scheduling, lifecycle management, resource management, security, monitoring, and user experience.

For more details about the solutions currently supported by BOB, please refer to the [project status section](#project-status) below.
We plan to continue adding support for many common functions required based on community demand and engagement in future releases. See our [roadmap](https://bobdotme.github.io/bob/#!roadmap.md) for more details.

## Getting Started and Documentation

For installation, deployment, and administration, see our [Documentation](https://bobdotme.github.io/bob/#!documentation.md)

## Contributing

We welcome contributions. See [Contributing](contrib.md) to get started.
We welcome contributions. See [license](license.md) to get started.

## Report a Bug

For filing bugs, suggesting improvements, or requesting new features, please open an [issue](https://github.com/bobdotme/bob/issues).

## Contact

Please use the following to reach members of the community:

- Email: [bob@bobdot.me](mailto:bob@bobdot.me)

## Security

### Reporting Security Vulnerabilities

If you find a vulnerability or a potential vulnerability in Rook please let us know immediately at
[bob@bobdot.me](mailto:bob@bobdot.me). We'll send a confirmation email to acknowledge your
report, and we'll send an additional email when we've identified the issues positively or
negatively.


## Project Status

The status of each utility provider supported by BOB can be found in the table below.

- **Alpha:** The API may change in incompatible ways in a later software release without notice, recommended for use only in short-lived testing clusters, due to increased risk of bugs and lack of long-term support.
- **Beta:** Support for the overall features will not be dropped, though details may change. Support for upgrading or migrating between versions will be provided, either through automation or manual steps.
- **Stable:** Features will appear in released software for many subsequent versions and support for upgrading between versions will be provided with software automation in the vast majority of scenarios.

| Name           | Details                                                                                                                                                                                                                                                                                                                | Status |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| BOB Framework  | The framework for the common utilities                                                                                                                                                                                                                                                                                 | Alpha  |
| proxy          | Proxy Services                                                                                              | Stable |
| container      | The micro container                                                                                         | Alpha  |

### Official Releases

Official releases of BOB can be found on the [releases page](https://github.com/bobdotme/bob/releases).
Please note that it is **strongly recommended** that you use [official releases](https://github.com/BobDotMe/bob/releases) of BOB, as unreleased versions from the master branch are subject to changes and incompatibilities that will not be supported in the official releases.
Builds from the master branch can have functionality changed and even removed at any time without compatibility support and without prior notice.

## Licensing

BOB is under the Apache 2.0 license.

```bash
./init.sh
```

images from: https://partner-images.canonical.com/core/groovy/current/
