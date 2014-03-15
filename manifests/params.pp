class lsyncd::params {

  $sync_source  = ''
  $sync_target  = ''
  $active       = true
  $lsyncd       = 'lsyncd'
  $config_tpl   = 'lsyncd/lsyncd.conf.erb'
  $excludes     = []
  $excludes_tpl = 'lsyncd/lsyncd-excludes.erb'
  $logfile      = '/var/log/lsyncd.log'
  $statusfile   = '/var/log/lsyncd.status'
  $rsh          = ''
  $rsyncOpts    = ''

  case $::osfamily {
    debian: {
      $config_dir    = '/etc/lsyncd'
      $config        = '/etc/lsyncd/lsyncd.conf.lua'
      $excludes_file = '/etc/lsyncd/lsyncd-excludes'
    }
    redhat: {
      $config_dir    = '/etc'
      $config        = '/etc/lsyncd.conf'
      $excludes_file = '/etc/lsyncd-excludes'
    }
    default: {
      fail("not supported on an ${::osfamily}.")
    }
  }
}
