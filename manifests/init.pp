# Class: lsyncd
#
# lsyncd.
#
# Sample Usage :
#  class { 'lsyncd':  }
#
class lsyncd (
  $sync_source       = $::lsyncd::params::sync_source,
  $sync_target       = $::lsyncd::params::sync_target,
  $active            = $::lsyncd::params::active,
  $excludes          = $::lsyncd::params::excludes,
  $lsyncd            = $::lsyncd::params::lsyncd,
  $lsyncd_config     = $::lsyncd::params::lsyncd_config,
  $lsyncd_config_tpl = $::lsyncd::params::lsyncd_config_tpl,
  $lsyncd_dir        = $::lsyncd::params::lsyncd_dir,
  $lsyncd_excludes   = $::lsyncd::params::lsyncd_excludes,
  $excludes_list     = $::lsyncd::params::excludes_list,
  $excludes_list_tpl = $::lsyncd::params::excludes_list_tpl,
  $logfile           = $::lsyncd::params::logfile,
  $statusfile        = $::lsyncd::params::statusfile,
  $rsh               = $::lsyncd::params::rsh,
  $rsyncOpts         = $::lsyncd::params::rsyncOpts,
) inherits lsyncd::params {

  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  package { $lsyncd: ensure => installed }

  service { $lsyncd:
    ensure    => $active,
    enable    => $active,
    hasstatus => true,
    require   => Package[$lsyncd],
  }

  file { $lsyncd_config:
    content => template($lsyncd_config_tpl),
    notify  => Service[$lsyncd],
    require => Package[$lsyncd],
  }

  if ($excludes == true) {
    file { $lsyncd_excludes:
    content => template($excludes_list_tpl),
    notify  => Service[$lsyncd],
    require => Package[$lsyncd],
    }
  }
}
