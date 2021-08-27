class debian_base {
  exec { update:
    command => '/usr/bin/apt update && /usr/bin/apt upgrade -y'
  }
  
  $packages = ['fish','vim','neofetch','git','net-tools','curl','golang-go']
  
  package { $packages:
    ensure => 'installed',
    require => Exec[update],
  }

  user { 'lucas':
    ensure => 'present',
    gid     => '1001',
    groups  => ['sudo'],
    home    => '/home/lucas',
    shell   => '/usr/bin/fish',
    uid     => '1001',
  }
}
