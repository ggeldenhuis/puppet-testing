class testing {
  file { '/tmp/testing':
    ensure => directory,
  }

  file { '/tmp/testing/file.one':
    ensure  => file,
    content => "\n Hello World",
  }

  file { '/tmp/testing/file.two':
    ensure  => file,
    content => "\n Hello People",
  }

}
