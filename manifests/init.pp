# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include review
class review (
  $users = lookup('review::users', Array[String], 'unique', 'review')
) {
    case $facts['kernel'] {
      'Linux': {

        include review::motd

        $users.each |String $user| {
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
      'windows': {
        $users.each |String $user| {
          user { $user:
            ensure => present,
            name   => $user,
            groups => [ 'Users' ],
          }
        }
      }
      default: { notify { "Too bad, so sad!\n": } }
    }
}
