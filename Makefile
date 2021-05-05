#
# Makefile for Sawyer
#
BUILDN=1.18.0.4
#----------------------------------------------------------------------
usage:
	@echo i"usage: make [git]"
#----------------------------------------------------------------------
git g:
	@echo "> make (git:g) [update|store]"

git-update gu:
	git add .
	git commit -a -m "$(BUILD),$(USER)"
	git push

git-store gs:
	git config credential.helper store
#----------------------------------------------------------------------

