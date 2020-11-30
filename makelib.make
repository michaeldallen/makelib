#BOF

.ONESHELL:

SHELL := bash

INDENT := 2>&1 | sed 's/^/    /'

make.targets :
	@echo "available Make targets:"
	@$(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null \
	| awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' \
	| sed 's/^/    make    /' \
	| env LC_COLLATE=C sort


make.clean.all :
	@${MAKE} make.targets | grep 'make.*\.clean$$' | while read make target ; do \
		echo making $${target} ; \
		eval ${MAKE} $${target} ${INDENT}; \
	done


make.clean :
	@rm -vf *~

#EOF
