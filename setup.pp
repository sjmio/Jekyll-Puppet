
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

nginx::resource::vhost { 'jekyll.local':
	ensure		=> present,
	www_root	=> "$www_root/jekyll",
}

