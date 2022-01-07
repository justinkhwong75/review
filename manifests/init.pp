# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include review
class review (
  $user = 'review',
) {
    include review::motd

    $users = lookup('users')
    $users.each |String $user| {
    if $facts['kernel'] == 'Linux' {
      $homedir = $user ? {
        'root'  => '/root',
        default => "/home/${user}",
      }

      user { $user:
        ensure     => present,
        shell      => '/bin/bash',
        managehome => true,
      }

      file { "${homedir}/.bashrc":
        ensure => file,
        owner  => $user,
        group  => $user,
        mode   => '0644',
        source => 'puppet:///modules/review/bashrc',
      }
    }
  }
