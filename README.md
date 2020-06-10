<img alt="bob" src="bob.svg" width="50%" height="50%">

[![Build Status](https://jenkins.rook.io/buildStatus/icon?job=rook/rook/master)](https://jenkins.rook.io/blue/organizations/jenkins/rook%2Frook/activity)
[![GitHub release](https://img.shields.io/github/release/rook/rook/all.svg?style=flat-square)](https://github.com/rook/rook/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/rook/rook.svg)](https://img.shields.io/docker/pulls/rook/rook.svg)
[![Go Report Card](https://goreportcard.com/badge/github.com/rook/rook)](https://goreportcard.com/report/github.com/rook/rook)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/1599/badge)](https://bestpractices.coreinfrastructure.org/projects/1599)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Frook%2Frook.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Frook%2Frook?ref=badge_shield)
[![Slack](https://slack.rook.io/badge.svg)](https://slack.rook.io)
[![Twitter Follow](https://img.shields.io/twitter/follow/rook_io.svg?style=social&label=Follow)](https://twitter.com/intent/follow?screen_name=rook_io&user_id=788180534543339520)

# What is BOB?

BOB is an open source **general purpose container** for Kubernetes, providing the utilities, support tools and a framework, that allows a diverse set problems to be solved for pod initialization and support to natively integrate with cloud-native environments.

BOB turns a simple container instanciation into a power support tool for general troubleshooting, service rendering, and performance evaluation.  It does this by creating a core set services that house and manage the utilities as well as a super lightweight container to invoke in a pod.  

BOB integrates deeply into cloud native environments leveraging extension points and providing a seamless experience for scheduling, lifecycle management, resource management, security, monitoring, and user experience.

For more details about the solutions currently supported by BOB, please refer to the [project status section](#project-status) below.
We plan to continue adding support for many common functions required based on community demand and engagement in future releases. See our [roadmap](ROADMAP.md) for more details.

## Getting Started and Documentation

For installation, deployment, and administration, see our [Documentation](https://rook.github.io/docs/rook/master).

## Contributing

We welcome contributions. See [Contributing](contrib.md) to get started.
We welcome contributions. See [license](license.md) to get started.

## Report a Bug

For filing bugs, suggesting improvements, or requesting new features, please open an [issue](https://github.com/bobdotme/bob/issues).

## Contact

Please use the following to reach members of the community:

- Slack: Join our [slack channel](https://slack.rook.io)
- Forums: [rook-dev](https://groups.google.com/forum/#!forum/rook-dev)
- Twitter: [@rook_io](https://twitter.com/rook_io)
- Email: [cncf-rook-info@lists.cncf.io](mailto:cncf-rook-info@lists.cncf.io)

## Security

### Reporting Security Vulnerabilities

If you find a vulnerability or a potential vulnerability in Rook please let us know immediately at
[cncf-rook-security@lists.cncf.io](mailto:cncf-rook-security@lists.cncf.io). We'll send a confirmation email to acknowledge your
report, and we'll send an additional email when we've identified the issues positively or
negatively.

For further details, please see the complete [security release process](SECURITY.md).

## Project Status

The status of each utility provider supported by BOB can be found in the table below.

- **Alpha:** The API may change in incompatible ways in a later software release without notice, recommended for use only in short-lived testing clusters, due to increased risk of bugs and lack of long-term support.
- **Beta:** Support for the overall features will not be dropped, though details may change. Support for upgrading or migrating between versions will be provided, either through automation or manual steps.
- **Stable:** Features will appear in released software for many subsequent versions and support for upgrading between versions will be provided with software automation in the vast majority of scenarios.

| Name           | Details                                                                                                                                                                                                                                                                                                                | API Group                    | Status |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------- | ------ |
| Rook Framework | The framework for common storage specs and logic used to support other storage providers.                                                                                                                                                                                                                              | rook.io/v1alpha2             | Alpha  |
| Ceph           | [Ceph](https://ceph.com/) is a distributed storage system that provides file, block and object storage and is deployed in large scale production clusters.                                                                                                                                                             | ceph.rook.io/v1              | Stable |
| CockroachDB    | [CockroachDB](https://www.cockroachlabs.com/product/cockroachdb/) is a cloud-native SQL database for building global, scalable cloud services that survive disasters.                                                                                                                                                  | cockroachdb.rook.io/v1alpha1 | Alpha  |
| Cassandra      | [Cassandra](http://cassandra.apache.org/) is a highly available NoSQL database featuring lightning fast performance, tunable consistency and massive scalability. [Scylla](https://www.scylladb.com) is a close-to-the-hardware rewrite of Cassandra in C++, which enables much lower latencies and higher throughput. | cassandra.rook.io/v1alpha1   | Alpha  |
| EdgeFS         | [EdgeFS](http://edgefs.io) is high-performance and fault-tolerant decentralized data fabric with access to object, file, NoSQL and block.                                                                                                                                                                              | edgefs.rook.io/v1            | Stable |
| NFS            | [Network File System (NFS)](https://github.com/nfs-ganesha/nfs-ganesha/wiki) allows remote hosts to mount file systems over a network and interact with those file systems as though they are mounted locally.                                                                                                         | nfs.rook.io/v1alpha1         | Alpha  |
| YugabyteDB     | [YugabyteDB](https://docs.yugabyte.com/latest/introduction/) is a high-performance, cloud-native distributed SQL database which can tolerate disk, node, zone and region failures automatically.                                                                                                                       | yugabytedb.rook.io/v1alpha1  | Alpha  |

### Official Releases

Official releases of BOB can be found on the [releases page](https://github.com/bobdotme/bob/releases).
Please note that it is **strongly recommended** that you use [official releases](https://github.com/bobdotme/bob/releases) of BOB, as unreleased versions from the master branch are subject to changes and incompatibilities that will not be supported in the official releases.
Builds from the master branch can have functionality changed and even removed at any time without compatibility support and without prior notice.

## Licensing

BOB is under the Apache 2.0 license.

