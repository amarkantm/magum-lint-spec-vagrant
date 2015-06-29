# == Class: common
#
# Full description of class common here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { common:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name puppet@example.com
#
# === Copyright
#
# Copyright (C) 2015 Example, Inc.
#
class common {

# Ensure existence of /etc/password file

  file { '/etc/passwd':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
}

# create user

  user { 'centos':
      ensure   => 'present',
      comment  => 'centos user',
      gid      => '501',
      home     => '/home/centos',
      shell    => '/bin/bash',
      uid      => '501',
      password => sha1('config'),
      require  => File['/etc/passwd'],
    }

  group { 'centos':
        ensure   => 'present',
	gid      => '501',
}

# create a directory      
  file { '/var/rsi':
    ensure => 'directory',
    owner  => 'centos',
    group  => 'centos',
    mode   => '0750',
  }

}
