# Roadmap

This document defines a high level roadmap for BOB development and upcoming releases.
The features and themes included in each milestone are optimistic in the sense that many do not have clear owners yet.
Community and contributor involvement is vital for successfully implementing all desired items for each release.
We hope that the items listed below will inspire further engagement from the community to keep Rook progressing and shipping exciting and valuable features.

Any dates listed below and the specific issues that will ship in a given milestone are subject to change but should give a general idea of what we are planning.
We use the [milestone](https://github.com/bobdotme/bob/milestones) feature in Github so look there for the most up-to-date and issue plan.


## BOB 1.0

The following high level features are targeted for Rook v1.4 (July 2020). For more detailed project tracking see the [v1.4 board](https://github.com/rook/rook/projects/18).

* Ceph
  * Admission controller [#4819](https://github.com/rook/rook/issues/4819)
  * RGW Multi-site replication (experimental) [#1584](https://github.com/rook/rook/issues/1584)
  * Handle IPv4/IPv6 dual stack configurations [#3850](https://github.com/rook/rook/issues/3850)
  * Support for provisioning OSDs with drive groups [#4916](https://github.com/rook/rook/pull/4916)
  * Multus networking configuration declared stable
  * RBD Mirroring configured with a CRD
  * All Ceph controllers updated to the controller runtime
  * Uninstall options for sanitizing OSD devices
  * Enhancements to external cluster configuration

## Themes

The general areas for improvements include the following, though may not be committed to a release.

* Core Controllers
  * Improve custom resource validation for each storage provider
* Proxy
  * Enable security analysis tools [#4578](https://github.com/rook/rook/issues/4578)
  * Run more comprehensive tests with a daily test run [#2828](https://github.com/rook/rook/issues/2828)
  * Include more environments in the test pipeline [#1841](https://github.com/rook/rook/issues/1841)
* Micro Container
  * Update [remaining Rook controllers](https://github.com/rook/rook/issues?q=is%3Aissue+is%3Aopen+%22controller+runtime%22+label%3Areliability+) to build on the controller runtime
