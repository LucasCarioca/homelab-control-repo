class debian_base {
  include secrets

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
    groups  => ['sudo'],
    home    => '/home/lucas',
    shell   => '/usr/bin/fish',
    uid     => '1002',
    password => $secrets::password
  }
}
