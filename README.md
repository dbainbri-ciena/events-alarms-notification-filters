# SEBA/VOLTHA Events, Alarms, Notifications, and Filters

This repo contains JSON schema documents that describe a proposed structure
for events, alarms, notifications, and filters for the SEBA/VOLTHA
environments. This is a preliminary thoughts and by no means final nor do have
they been completely vetted or have input absorbed by the full community yet.
The goal is to get input from the community and standards and morth these into
something that works and is agreed on by the community.

## Schema
The schema documuments are in the `schemas` directory. The objects are:
- event - based object with common header information
- alarm - an event with priority and severity
- notification - an alarm with references to other items on which the
  notification was derived
- filter - a basic include/exclude filter

### Labels
A labels list was added to the basic event. The purpose of this was to
potentially use labels as opposed to a hierarchical naming scheme. This is
currently experimental.

## Samples
See the `samples` directory
