
$www_root = "/var/www"

class { "jekyll":
}

class { "nginx": }

file { "/var/www":
	ensure	=> "directory",
	mode	=> 775,
	owner	=> "www-data",
	group	=> "www-data"
}

nginx::resource::vhost { 'jeckyll.local':
	ensure		=> present,
	www_root	=> "$www_root/jeckyll",
	notify		=> Service["nginx"]
}

