class elasticsearch::service(
  $ensure = undef,
  $enable = undef
) {

  case $ensure {
    'running', 'stopped': { $ensure_real = $ensure }
    default:              { fail('Class[elasticsearch::service]: parameter ensure must be running or stopped') }
  }

  case $enable {
    true, false: { $enable_real = $enable }
    default:     { fail('Class[elasticsearch::service]: parameter enable must be a boolean') }
  }

  service { 'elasticsearch':
    ensure    => $ensure_real,
    enable    => $enable_real,
    hasstatus => true
  }

}
