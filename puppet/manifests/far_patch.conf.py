#!/usr/bin/python
import os

controllerip='172.30.0.24'


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




afile='/etc/nova/nova.conf'
find='''connection=mysql://nova:nova_pass@127.0.0.1/nova'''
repl="""connection=mysql://nova:nova_pass@%(controllerip)s/nova""" % {'controllerip':controllerip}

findreplacefile(find,repl,afile)

afile='/etc/cinder/cinder.conf'
find='''sql_connection=mysql://cinder:cinder_pass@127.0.0.1/cinder'''
repl="""sql_connection=mysql://cinder:cinder_pass@%(controllerip)s/cinder""" % {'controllerip':controllerip}

findreplacefile(find,repl,afile)




