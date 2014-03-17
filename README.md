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

###Lsyncd 2.1 Configuration with RSH paramaters

```puppet
class { 'lsyncd':
  sync_target => 'lily.nodata.org:/opt/mirror/',
  sync_source => '/opt/mirror/',
  rsh         => '"/usr/bin/ssh -i /home/mirror/.ssh/id_rsa -l mirror",'
}
```

###Lsyncd 2.0 Configuration with rsync options and excludes
 
```puppet
class { 'lsyncd':
  sync_target  => 'lily.nodata.org:/opt/mirror-debian/',
  sync_source  => '/opt/mirror-debian/',
  excludes     => [ "/nosync", "/nosync2" ],
  rsyncOpts    => '"-e /usr/bin/ssh -i /home/mirror/.ssh/id_rsa -l mirror", "-H"',
}
```
