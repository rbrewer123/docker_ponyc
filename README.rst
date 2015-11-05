##############################
Pony Express Appliance
##############################

Purpose
###########

This ``Dockerfile`` creates a sandboxed, runnable `Pony Compiler
<http://ponylang.org>`_ environment based on the latest commit to master
on GitHub.


Requirements
################

This is tested with the following software:

* llvm-3.6
* docker 1.8.0 (running on Ubuntu 14.04)

Since its main dependency is docker, it should run on any platform with
docker installed (e.g. Windows, OS X).  It may or may not work with earlier
versions of docker.  To install docker on your system, see the official
`docker installation instructions <https://docs.docker.com/installation>`_.


Installation
##############

To build the docker image::

  $ docker build -t rbrewer123/ponyc github.com/rbrewer123/docker_ponyc

You can see your new image with this command::

  $ docker images

Grab the ``ponyc`` script from github like this::

  $ git clone https://github.com/rbrewer123/docker_ponyc

Now update the ``docker_ponyc/ponyc`` script to use your correct
``username``, ``uid``, ``group``, and ``gid``.  This avoids problems with
files being owned by root or other permissions problems that often occur
when using docker in this manner.


Run
#######

To run ``ponyc`` from within the container, simply run the ``ponyc`` script::

  $ docker_ponyc/ponyc --help


Limitations 
#############

If you discover any limitations or bugs, please submit a GitHub issue.

