class yeoman {
    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

    $yeomanPackages = ["git", "libjpeg-turbo-progs", "optipng", "phantomjs", "python-software-properties" ]

    package { $yeomanPackages:
      ensure => "installed",
      require => Exec['apt-get update'],
    }
    exec { "apt-get update":
      command => "/usr/bin/apt-get update"
    }
    package { 'compass':
      ensure   => latest,
      provider => 'gem',
      require  =>  Package["rubygems"],
    }
    package { 'yo':
      ensure => present,
      provider => 'npm',
      require => Class["nodejs"],
    }
    package { 'grunt-cli':
      ensure => present,
      provider => 'npm',
      require => Class["nodejs"],
    }
    package { 'bower':
      ensure => present,
      provider => 'npm',
      require => Class["nodejs"],
    }
}
include rubygems
include nodejs
include yeoman
