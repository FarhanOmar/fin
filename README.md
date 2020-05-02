### Ubuntu 18.04 LTS Install

On a clean ubuntu install:

First create a non-root user (financier), gives financier user sudo access and log in as this user:

```
$ sudo adduser financier
$ sudo usermod -aG sudo financier
$ su financier
$ cd ~/
```

Now once you're logged in as a non-root user, run:
```
$ sudo apt install curl
$ bash <(curl -s https://raw.githubusercontent.com/FarhanOmar/fin/master/ubuntu_install.sh)

```
Notes:
* When the CouchDB installation prompts you for input, use the defaults (and be sure to enter an admin password)
