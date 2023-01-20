# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include review
class review (
  #$users = lookup('review::users', Array[String], { 'merge' => 'unique' }, 'review')
  #$users_hash = lookup('review::users_hash', Hash[String], { 'merge' => 'unique' }, {})
  $users_hash = [ "daffy", "sam" ]

) {
    case $facts['kernel'] {
      'Linux': {

        #include review::motd

        #$users.each |String $user| {
        #  $homedir = $user ? {
        #    'root'  => '/root',
        #    default => "/home/${user}",
        #  }

        # user { $user:
          #  ensure     => present,
          # shell      => '/bin/bash',
          #  #managehome => true,
          #}

          #file { "${homedir}/.bashrc":
          #  ensure => file,
          #  owner  => $user,
          #  group  => $user,
          #  mode   => '0644',
          #  source => 'puppet:///modules/review/bashrc',
          #}

          #file { "${homedir}/yay.txt":
          #  ensure  => file,
          #  owner   => $user,
          #  group   => $user,
          #  content => 'I love Puppet!',
          #}

          #$users_hash.each | String $usr, Hash $options | {
          #  $homedir = $usr ? {
          #    'root'  => '/root',
          #    default => "/home/${usr}",
          #  }
          #  user { $usr:
          #    ensure     => present,
          #    shell      => $options[shell],
          #    managehome => true,
          #  }
          #  file { "${homedir}/yay.txt":
          #    ensure  => file,
          #    owner   => $usr,
          #    group   => $usr,
          #    content => $options[filecontent],
          #  }
          #}
        #}
      }
      'windows': {
        #$users.each |String $user| {

        #  $homedir = "C:\\Users\\$user"

        #  user { $user:
        #    ensure => present,
        #    name   => $user,
        #    groups => [ 'Users' ],
        #  }
        #}
      }
      default: { notify { "Too bad, so sad!\n": } }
    }
  }
