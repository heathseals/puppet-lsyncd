#lsyncd

##Overview

The lsyncd module installs, configures, and manages a basic deployment of lsyncd.

##Usage

###Minimum

```puppet
class { 'lsyncd':
    sync_target => 'targethost:/targetdir/',
    sync_source => '/sourcedir/',
}
```
