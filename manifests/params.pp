class lsyncd::params {

  $sync_source        = ''
  $sync_target        = ''
  $active             = true
  $excludes           = false
  $lsyncd             = 'lsyncd'
  $lsyncd_dir         = '/etc/lsyncd'
  $lsyncd_config_tpl  = 'lsyncd/lsyncd.conf.erb'
  $excludes_list      = []
  $excludes_list_tpl  = 'lsyncd/lsyncd-excludes.erb'
  $logfile            = '/var/log/lsyncd.log'
  $statusfile         = '/var/log/lsyncd.status'
  $rsh                = ''
  $rsyncOpts          = ''

  case $::osfamily {
    debian: {
      $lsyncd_config      = '/etc/lsyncd/lsyncd.conf.lua'
      $lsyncd_excludes    = '/etc/lsyncd/lsyncd-excludes'
    }
    redhat: {
      $lsyncd_config      = '/etc/lsyncd.conf'
      $lsyncd_excludes    = '/etc/lsyncd-excludes'
    }
    default: {
      fail("not supported on an ${::osfamily}.")
    }
  }
}
