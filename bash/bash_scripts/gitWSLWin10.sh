#!/bin/sh

# checks to see if we are in a windows or linux dir
isInsideMntDir() {
	# REPO_1=$(pwd | awk -F "/" '{print $1}')
	# REPO_1=awk -v pwd="$PWD" -F "/" '{print $1}'
	# echo "$REPO_1"
	# case $REPO_1 in

	case $PWD/ in
	/mnt/*)
		# return "$(true)"
		return 0
		;;
	*)
		# return "$(false)"
		return 1
		;;
	esac
}

# wrap the git command to either run windows git or linux
git() {
	if isInsideMntDir; then
		echo "ciao"
		git.exe "$@"
	else
		echo "hello"
		/usr/bin/git "$@"
	fi
}
