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





fl='/etc/lvm/lvm.conf'

afile='/etc/lvm/lvm.conf'
find='''filter = [ "a/.*/" ]'''
repl='''filter = [ "a/sda1/", "a/sdb/", "r/.*/"]'''

findreplacefile(find,repl,afile)



