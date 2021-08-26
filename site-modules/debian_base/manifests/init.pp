class debian_base {
	exec { update:
		command => '/usr/bin/apt update && /usr/bin/apt upgrade -y'
	}
	
	$packages = ['fish','vim','neofetch','git','net-tools','curl','golang-go']
	
	package { $packages:
		ensure => 'installed',
		require => Exec[update],
	}
}
