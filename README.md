# Alpine SSH Man-in-the-Middle 
* docker will start the real and unmodified ssh daemon within the docker on port 22
* ssh-mitm-proxy will run and expose port on 4444 and forward ssh traffic to port 22

# Credentials
* username = hacker
* password = compass

# Architecture
```bash
 +-------------------------------------------------------------+
 |                                                             |
 |                                                             |
 |              +-----------+             +---------------+    |
 |  port 4444   |           |    port 22  |               |    |
 |              | ssh proxy |             |  alpine       |    |
 +------------->+           +-------------+  openssh      |    |
 |              |           |             |  server       |    |
 |              +-----------+             +---------------+    |
 |                                                             |
 |                                                             |
 +-------------------------------------------------------------+
```

# Docker Hub
* https://hub.docker.com/repository/docker/hackinglab/alpine-ssh-mitm-legacy/general
