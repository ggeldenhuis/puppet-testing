class testing {
  file { '/tmp/testing':
    ensure => directory,
  }

  file { '/tmp/testing/file.one':
    ensure  => file,
    content => "Hello World\n",
  }

  file { '/tmp/testing/file.two':
    ensure  => file,
    content => "Hello People\n",
  }

}
