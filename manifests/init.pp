# Class: lsyncd
#
# lsyncd.
#
# Sample Usage :
#  class { 'lsyncd':  }
#
class lsyncd (
  $sync_source   = $::lsyncd::params::sync_source,
  $sync_target   = $::lsyncd::params::sync_target,
  $active        = $::lsyncd::params::active,
  $lsyncd        = $::lsyncd::params::lsyncd,
  $config        = $::lsyncd::params::config,
  $config_tpl    = $::lsyncd::params::config_tpl,
  $config_dir    = $::lsyncd::params::config_dir,
  $excludes      = $::lsyncd::params::excludes,
  $excludes_tpl  = $::lsyncd::params::excludes_tpl,
  $excludes_file = $::lsyncd::params::excludes_file,
  $logfile       = $::lsyncd::params::logfile,
  $statusfile    = $::lsyncd::params::statusfile,
  $rsh           = $::lsyncd::params::rsh,
  $rsyncOpts     = $::lsyncd::params::rsyncOpts,
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

  file { $config:
    content => template($config_tpl),
    notify  => Service[$lsyncd],
    require => File[$config_dir],
  }

  file { $config_dir:
      ensure => "directory"
  }

  unless $excludes == '' {
    file { $excludes_file:
    content => template($excludes_tpl),
    notify  => Service[$lsyncd],
    require => Package[$lsyncd],
    }
  }
}
