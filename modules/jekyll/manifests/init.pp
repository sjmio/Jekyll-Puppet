
class jekyll (
	$deploy_user = "deploy",
	$repo = "jekyll.git",
	$www_root = "/var/www"
) {
	$repo_path = "/home/$deploy_user/$repo"
	
	
	# Resource Defaults
	
	File {
		owner	=> $deploy_user,
		group	=> $deploy_user
	}
	
	Exec {
		user	=> $deploy_user,
		group	=> $deploy_user,
		path	=> ["/usr/bin", "/usr/sbin"]
	}
	
	
	# Jekyll packages
	
	package { ["ruby1.9.1-dev", "rubygems", "python-pygments"]: }

	package { ["jekyll", "rdiscount", "RedCloth"]:
		provider	=> "gem",
		require		=> Package["rubygems"]
	}

	file { "/var/lib/gems/1.8/specifications/directory_watcher-1.4.1.gemspec":
		source	=> "puppet:///modules/jekyll/directory_watcher-1.4.1.gemspec",
		mode	=> 0644,
		owner	=> root,
		group	=> root,
		require	=> Package["rubygems"]
	}

	# Configure deploy user
	
	user { $deploy_user:
		managehome	=> true,
		groups		=> ["www-data"],
		shell		=> "/bin/bash"
	}

	file { "/home/$deploy_user/.ssh":
		ensure	=> "directory",
		mode	=> 700,
	}

	file { "/home/$deploy_user/.ssh/authorized_keys":
		mode	=> 600,
	}


	# Setup deploy repository and post-receive hook
	
	package { "git": }
	
	exec { "jekyll-bare-repo":
		command	=> "git init --bare $repo_path",
		creates	=> $repo_path,
		require	=> Package["git"]
	}
	
	file { "$repo_path/hooks/post-receive":
		mode	=> 0755,
		content	=> template("jekyll/post-receive.erb"),
		require	=> Exec["jekyll-bare-repo"]
	}
}
