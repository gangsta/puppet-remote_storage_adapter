#
##
###
class remote_storage_adapter::config (
  $binary_path         = undef,
  $graphite_address,   = undef,
  $graphite_prefix,    = undef,
  $graphite_transport, = undef,
  $influxdb_url,       = undef,
  $influxdb_database,  = undef,
  $influxdb_retention, = undef,
  $influxdb_username,  = undef,
  $opentsdb_url,       = undef,
  $send_timeout,       = undef,
  $web_listen_address, = undef,
  $web_telemetry_path, = undef,
) {
  file { "$remote_storage_adapter::config::binary_path/remote_storage_adapter":
    source => "puppet:///modules/remote_storage_adapter/remote_storage_adapter"
  }
  -> file { '/lib/systemd/system/remote_storage_adapter.service':
    mode    => '0555',
    owner   => 'root',
    group   => 'root',
    content => epp('remote_storage_adapter/remote_storage_adapter_service.epp'),
  }
}
