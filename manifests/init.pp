# Class: remote_storage_adapter
# ===========================
#
# Full description of class remote_storage_adapter here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# -graphite-address string
#       The host:port of the Graphite server to send samples to. None, if empty.
# -graphite-prefix string
#       The prefix to prepend to all metrics exported to Graphite. None, if empty.
# -graphite-transport string
#       Transport protocol to use to communicate with Graphite. 'tcp', if empty. (default "tcp")
# -influxdb-url string
#       The URL of the remote InfluxDB server to send samples to. None, if empty.
# -influxdb.database string
#       The name of the database to use for storing samples in InfluxDB. (default "prometheus")
# -influxdb.retention-policy string
#       The InfluxDB retention policy to use. (default "autogen")
# -influxdb.username string
#       The username to use when sending samples to InfluxDB. The corresponding password must be provided via the INFLUXDB_PW environment variable.
# -opentsdb-url string
#       The URL of the remote OpenTSDB server to send samples to. None, if empty.
# -send-timeout duration
#       The timeout to use when sending samples to the remote storage. (default 30s)
# -web.listen-address string
#       Address to listen on for web endpoints. (default ":9201")
# -web.telemetry-path string
#       Address to listen on for web endpoints. (default "/metrics")
#
# Authors
# -------
#
# Karen Har-yan @kalinux <kalinux.nl>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class remote_storage_adapter (
  graphite_address          = undef,
  graphite_prefix           = undef,
  graphite_transport        = undef,
  influxdb_url              = undef,
  influxdb_database         = undef,
  influxdb_retention_policy = undef,
  influxdb_username         = undef,
  opentsdb_url              = undef,
  send_timeout              = undef,
  web_listen_address        = undef,
  web_telemetry_path        = undef,
  binary_path               = '/usr/sbin',
  service_ensure            = 'running',
  service_enable            = true,
  manage_service            = true,
){

  anchor {'remote_storage_adapter_first': }
  -> class { '::remote_storage_adapter::config':
    binary_path               => $binary_path,
    graphite_address          => $graphite_address,
    graphite_prefix           => $graphite_prefix,
    graphite_transport        => $graphite_transport,
    influxdb_url              => $influxdb_url,
    influxdb_database         => $influxdb_database,
    influxdb_retention_policy => $influxdb_retention,
    influxdb_username         => $influxdb_username,
    opentsdb_url              => $opentsdb_url,
    send_timeout              => $send_timeout,
    web_listen_address        => $web_listen_address,
    web_telemetry_path        => $web_telemetry_path,
  }
  -> class { '::remote_storage_adapter::service':
    service_ensure => $service_ensure,
    service_enable => $service_enable,
    manage_service => $manage_service,
  }
  -> anchor {'remote_storage_adapter_last': }
}
