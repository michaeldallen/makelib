#BOF

include makelib.make
include makelib.openscad

_makefile :
	echo "#BOF" > makelib.test
	echo "test.test :" >> makelib.test
	echo "	@echo hello make" >> makelib.test
	echo "" >> makelib.test
	echo "test.clean :" >> makelib.test
	echo "	rm -fv makelib.test" >> makelib.test
	ls | egrep 'makelib\.[-_a-z0-9]*$$' | while read makelib; do echo include $${makelib} ; done > Makefile.makelib

_clean :
	@rm -fv Makefile.makelib
	@rm -fv makelib.test

#EOF

