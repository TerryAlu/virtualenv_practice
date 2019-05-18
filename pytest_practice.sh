#!/bin/bash -e
cd $HOME

# install dependency
apt update
apt install -y python-pip virtualenv wget curl openssl libssl-dev zlib1g-dev

cd $HOME			

# download python 2.7.13 & 3.5.3 tarball
wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz
wget https://www.python.org/ftp/python/3.5.3/Python-3.5.3.tgz

# unzip tarball
tar zxvf Python-2.7.13.tgz
tar zxvf Python-3.5.3.tgz

# make and install python 2.7
cd Python-2.7.13
./configure --with-ssl
make install

cd $HOME

# make and install python 3.5
cd Python-3.5.3
./configure --with-ssl
make install

cd $HOME

# create virtual env for py2 & py3
mkdir project && cd project
virtualenv -p /usr/local/bin/python2 py2.7.13
virtualenv -p /usr/local/bin/python3 py3.5.3

# install pytest 3.0.7 for py2
source ./py2.7.13/bin/activate
pip install pytest==3.0.7
deactivate

# install pytest 3.0.7 for py3
source ./py3.5.3/bin/activate
pip install pytest==3.0.7
deactivate

# done
echo "Done"


