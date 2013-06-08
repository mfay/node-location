class mysql {
	package {
		"mysql-server":
		ensure => installed,
		before => File["/etc/my.cnf"]
	}
	file {
		"/etc/my.cnf":
		owner => root,
		group => root,
		mode => 644,
		source => "puppet:///modules/mysql/my.cnf"
	}
	service {
		"mysqld":
		ensure => running,
		subscribe => File["/etc/my.cnf"]
	}
	# exec {
	# 	"mysql_password":
	# 	unless => "mysqladmin -uroot -proot status",
	# 	command => "mysqladmin -uroot password root",
	# 	require => Service["mysqld"];
	# }
}