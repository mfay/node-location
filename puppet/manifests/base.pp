Exec {
	path => ['/usr/local/bin', '/bin', '/usr/bin', '/usr/local/sbin', '/sbin']
}

include mysql
include sqlite

# change these to match your project
$folder_name = "sinatra-base"
$database_name = "sinatra_base" # remember db names cannot have - in their name.

file { "sim_link_setup":
	path => "/var/www/html/$folder_name",
	ensure => 'link',
	target => '/mydata/public'
}

file { '/mydata/public/.htaccess':
	content => "RackEnv development\nRackBaseURI /$folder_name"
}

exec {
	"gem install bundle":
	cwd => "/mydata",
	unless => "gem list | grep bundle"
}

exec {
	"bundle install":
	cwd => "/mydata",
	require => Package["sqlite-devel"]
}

exec {
	"create_database":
	unless => "mysql -uroot $database_name",
	command => "mysql -uroot -e 'create database $database_name'",
	require => Service["mysqld"];
}

