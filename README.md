ei-grad/ssh-ambassador docker image
===================================

Lightweight ssh client container based on alpine linux image. Suitable to be
used as docker ambassador container for containers located on different hosts
connected over the insecure network.

Example usage
-------------

```bash
docker run -d \
  --name mysql_ambassador \
  -v .ssh:/keys \
  eigrad/ssh-ambassador root@db.example.com 3306 \
  -p 3022  # if ssh uses the custom port on server

docker run -d --link mysql_ambassador:mysql examplecom/wordpress
```

Default ```ssh_config``` expects to find the ```id_rsa``` key and the
```known_hosts``` file in the ```/keys``` directory. Password authentication
and host key adding are disabled (ensure that the key of the host where you
would like to connect is already added to the known_hosts file).

Of course, you can override it by ```-v your_own_ssh_config:/etc/ssh/ssh_config```.

It is also possible to pass an additional ssh parameters after the service port
number in the command:

```bash
docker run -d \
  --name mysql_ambassador \
  -v .ssh:/keys \
  eigrad/ssh-ambassador example.com 12345 \
  -o StrictHostKeyChecking=no \
  -o UserKnownHostsFile=/dev/null
```

Environment variables
---------------------

* ```TARGET_HOST``` - host to connect on the remote side (default: localhost)

* ```EXPOSED_PORT``` - port to expose (bind) on the local side (default: equal
                       to the service port)

License and contributing
------------------------

This docker container source files could be used under the BSD license. See LICENSE file for details.

Issue reporting and ideas sharing are always [welcome](http://github.com/ei-grad/docker-ssh-ambassador/issues).
