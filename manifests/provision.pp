# Deploy OpenStack resources needed to run Tempest

class openstack_integration::provision {

  include ::openstack_integration::config

  glance_image { 'cirros':
    ensure           => present,
    container_format => 'bare',
    disk_format      => 'qcow2',
    is_public        => 'yes',
    source           => '/tmp/openstack/image/cirros-0.4.0-x86_64-disk.img'
  }
  glance_image { 'cirros_alt':
    ensure           => present,
    container_format => 'bare',
    disk_format      => 'qcow2',
    is_public        => 'yes',
    source           => '/tmp/openstack/image/cirros-0.4.0-x86_64-disk.img'
  }
  Keystone_user_role['admin@openstack'] -> Glance_image<||>
}
