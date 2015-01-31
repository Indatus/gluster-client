default['gluster-client']['ubuntu_ppa'] = "ppa:gluster/glusterfs-3.6"
default['gluster-client']['rhel_packages'] = ['glusterfs-fuse', 'glusterfs', 'glusterfs-libs', 'glusterfs-api']
default['gluster-client']['rhel_repo'] = "http://download.gluster.org/pub/gluster/glusterfs/3.6/LATEST/CentOS/glusterfs-epel.repo"
default['gluster-client']['rhel_key'] = "http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/pub.key"
default['gluster-client']['debian_packages'] = ['glusterfs-client', 'glusterfs-common']
default['gluster-client']['debian_repo'] = "http://download.gluster.org/pub/gluster/glusterfs/3.6/3.6.2/Debian/wheezy/apt"
default['gluster-client']['debian_key'] = "http://download.gluster.org/pub/gluster/glusterfs/3.6/3.6.2/Debian/wheezy/pubkey.gpg"
