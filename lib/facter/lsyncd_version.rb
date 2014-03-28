# A facter fact to determine the version of lsycnd
#

Facter.add('lsyncd_version') do
  setcode do
    case Facter.value('osfamily')
      when /RedHat/
        version = %x{/bin/rpm -q --queryformat "%{VERSION}-%{RELEASE}" lsyncd}
      when /Debian/
        version = %x{/usr/bin/dpkg-query -W -f='${Version}' lsyncd 2>/dev/null}
      else
        version = 'undef'
    end

    if version =~ /^2.0/
        version = "2.0"
    elsif version =~ /^2.1/
        version = "2.1"
    else
        version = 'undef'
    end
  end
end
