#
##
###
class remote_storage_adapter::service (
  $service_ensure = undef,
  $service_enable = undef,
  $manage_service = undef,
){
  if ! ($service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $manage_service {
    service { 'remote_storage_adapter':
      ensure  => $service_ensure,
      enable  => $service_enable,
    }
  }
}
