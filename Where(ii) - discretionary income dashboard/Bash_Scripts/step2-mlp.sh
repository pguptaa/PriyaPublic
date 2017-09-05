#! /bin/sh
#as root user

#installing python2.7 packages

wget https://bootstrap.pypa.io/get-pip.py
python2.7 get-pip.py
python2.7 -m pip install numpy
python2.7 -m pip install cython
python2.7 -m pip install pandas
python2.7 -m pip install xlrd
#as user
su - w205
