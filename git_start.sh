#!/bin/bash

################################################################################

# GIT START
# Contributor: Priyanka Miranda

################################################################################

# --------------------------USAGE-----------------------------------------
# run git_start.sh on command line with the following arguments
# -r - REPOSITORY NAME 
# -d - DESCRIPTION
# -p - PROJECT PATH

################################################################################

while getopts r:d:p: Options;
	do
	case "$Options" in	

	# Option s - Specify Source Folder Location
	r)	# Read Source Folder Location
		sDir=$OPTARG
		echo "Option -r used. Source Folder: $OPTARG"
		;;

	# Option d - Specify Destination Folder Location
	d)	# Read Destination Folder Location
		dDir=$OPTARG
		echo "Option -d used. Destination Folder: $OPTARG"
		;;
		
	# Option n - Number of Characters to Retain
	p)	# Read Number of Characters to Retain
		nChar=$OPTARG
		echo "Option -p used. Retaining $nChar Characters."
		;;
		
	# Unspecified Option
	\?)	# Issue an Error Message
		echo "Invalid Option!"
		echo "---------------------------CORRECT USAGE---------------------------"
		echo "bash git_start.sh -r <REPOSITORY NAME> -d <DESCRIPTION> -p <PROJECT PATH>" 
		;;		
    esac
done

source .gitignore/authentication.sh


# CURRENTDIR=${pwd}

# EMAIL_ID=${login_email}
# GITHUB_PWD=${github_password}
# GITLAB_PWD=${gitlab_password}

# # step 1: name of the remote repo. Enter a SINGLE WORD ..or...separate with hyphens
# echo "What name do you want to give your remote repo?"
# read REPO_NAME

# echo "Enter a repo description: "
# read DESCRIPTION


# # step 2:  the local project folder path
# echo "what is the absolute path to your local project directory?"
# read PROJECT_PATH

# echo "What is your github username?"
# read USERNAME

# # step 3 : go to path 
# cd "$PROJECT_PATH"


# # step 4: initialise the repo locally, create blank README, add and commit
# git init
# touch README.MD
# git add README.MD
# git commit -m 'initial commit -setup with .sh script'


# # step 5 use github API to log the user in
# curl -u ${USERNAME} https://api.github.com/user/repos -d "{\"name\": \"${REPO_NAME}\", \"description\": \"${DESCRIPTION}\"}"

# #  step 6 add the remote github repo to local repo and push
# git remote add origin https://github.com/${USERNAME}/${REPO_NAME}.git
# git push --set-upstream origin master

# # step 7 change to your project's root directory.
# cd "$PROJECT_PATH"

# echo "Done. Go to https://github.com/$USERNAME/$REPO_NAME to see." 
# echo " *** You're now in your project root. ***"