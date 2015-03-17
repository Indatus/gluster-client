gluster-client Cookbook
=======================
Installs glusterfs native client packages and mounts volumes.

Requirements
------------
* [yum](https://supermarket.chef.io/cookbooks/yum)
* [apt](https://supermarket.chef.io/cookbooks/apt)

Tested on Ubuntu 12.04, Debian 7.1 and SL6.5. Will not work on Debian earlier than 7.0, Ubuntu older than 12.04 or rhel based distros older than 6.0.

Attributes
----------
* `default['gluster-client']['ubuntu_ppa'] = "ppa:gluster/glusterfs-3.6"`
* `default['gluster-client']['rhel_packages'] = ['glusterfs-fuse', 'glusterfs', 'glusterfs-libs', 'glusterfs-api']`
* `default['gluster-client']['rhel_repo'] = "http://download.gluster.org/pub/gluster/glusterfs/3.6/LATEST/CentOS/glusterfs-epel.repo"`
* `default['gluster-client']['debian_packages'] = ['glusterfs-client', 'glusterfs-common']`
* `default['gluster-client']['debian_repo'] = "http://download.gluster.org/pub/gluster/glusterfs/3.6/3.6.2/Debian/wheezy/apt"`
* `default['gluster-client']['debian_key'] = "http://download.gluster.org/pub/gluster/glusterfs/3.6/3.6.2/Debian/wheezy/pubkey.gpg"`

Usage
-----
Just include `gluster-client` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[gluster-client]"
  ]
}
```

and specify the mounts in your role file:

```json
    "mounts" => {
        "gluster" => {
            "/mnt/distributed-volume"=> "brick1.com,brick2.com,brick3.com,brick4.com:/volume-name"
        }
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: ssavov@indatus.com
