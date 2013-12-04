#!/usr/bin/python
import os

def findreplacefile(find,replace,afile):

	tempfile=afile+'.puppettmp'

	fd=open(afile,'r')
	fd1=open(tempfile,'w')

	for line in fd:
		fd1.write(line.replace(find, replace))
	#	if line.strip()==find:
#			fd1.write(replace)
#		else:
#			fd1.write(line)
	fd.close()
	fd1.close()
	os.rename(tempfile,afile)




afile='/etc/openstack-dashboard/local_settings.py'
find='''DEBUG = False'''
repl='''DEBUG = True'''

findreplacefile(find,repl,afile)

afile='/etc/openstack-dashboard/local_settings.py'
find='''OPENSTACK_KEYSTONE_DEFAULT_ROLE = "Member"'''
repl='''OPENSTACK_KEYSTONE_DEFAULT_ROLE = "admin"'''

findreplacefile(find,repl,afile)




