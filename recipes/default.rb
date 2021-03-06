# add them repos
# for Ubuntu and debian
include_recipe 'apt'
apt_repository "glusterfs-3_6" do
  uri node['gluster-client']['debian_repo']
  distribution node['lsb']['codename']
  components ["main"]
  arch "amd64"
  key node['gluster-client']['debian_key']
  only_if { platform?("debian")  }
end

apt_repository 'glusterfs-3_6' do
  uri node['gluster-client']['ubuntu_ppa']
  distribution node['lsb']['codename']
  only_if { platform?("ubuntu")  }
end

# for rhel
include_recipe 'yum'
remote_file "/etc/yum.repos.d/glusterfs-epel.repo" do
  source node['gluster-client']['rhel_repo']
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
  only_if { platform_family?("rhel")  }
end
# install them packages
case node['platform_family']
when 'debian'
  node['gluster-client']['debian_packages'].each do |pkg|
    package pkg
  end
when 'rhel'
  node['gluster-client']['rhel_packages'].each do |pkg|
    package pkg do
	version node['gluster-client']['rhel_version']
	options "--disablerepo=* --enablerepo=glusterfs*"
    end
  end
end
# do the mounting
node['mounts']['glusterfs'].each do |mnt, dev|

  directory mnt do
    recursive true
    mode 0777
    not_if "stat -c%a /mnt/zd|grep 777"
  end

  mount mnt do
    device dev
    fstype "glusterfs"
    options "rw"
    action :mount
    not_if "cat /proc/mounts | grep glusterfs| grep #{mnt}"
  end
  
    mount mnt do
    device dev
    fstype "glusterfs"
    options "rw"
    action :enable
    not_if "cat /etc/fstab | grep glusterfs| grep #{mnt}"
  end
end
