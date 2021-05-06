#
# Makefile for Sawyer
#
BUILD=2.18.4.5
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

