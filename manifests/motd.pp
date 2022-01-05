# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include review::motd
class review::motd {
  file { '/etc/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "Have a great day!\n",
  }
}
