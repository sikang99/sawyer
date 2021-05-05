#
# Makefile for Sawyer
#
BUILDN=1.18.0.3
#----------------------------------------------------------------------
usage:
	@echo i"usage: make [git]"
#----------------------------------------------------------------------
git-update gu:
	@echo "> make (git:g) [update|store]"

git-pdate gu:
	git add .
	git commit -a -m "$(BUILD),$(USER)"
	git push

git-store gs:
	git config credential.helper store
#----------------------------------------------------------------------

