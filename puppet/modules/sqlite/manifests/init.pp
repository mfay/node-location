class sqlite {
	package {
		"sqlite":
		ensure => installed
	}
	package {
		"sqlite-devel":
		ensure => installed
	}
}