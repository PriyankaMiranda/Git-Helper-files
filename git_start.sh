#!/bin/bash

################################################################################

# GIT START
# Contributor: Priyanka Miranda

################################################################################

# --------------------------USAGE-----------------------------------------
# run git_start.sh on command line with the following arguments
# -p - PROJECT PATH (mandatory)
# -r - REPOSITORY NAME (not mandatory)
# -d - YOU WANT TO WRITE DESCRIPTION (not mandatory)

################################################################################

while getopts p:r:d: Options;
	do
	case "$Options" in	
		
	# Option n - Specify Project Path
	p)	# Read Project Path
		PROJECT_PATH=$OPTARG
		echo "Local Absolute Project Path: $OPTARG"
		;;

	# Option s - Specify Repository Name
	r)	# Read Repository Name
		REPO_NAME=$OPTARG
		echo "Repository Name: $OPTARG"
		;;

	# Option d - Specify Description
	d)	# Read Description Option
		DESCRIP=$OPTARG
		SELECTED='y'
		if [ "$DESCRIP" == "$SELECTED" ]; then
		    echo "You have chosen to write a description"
		    echo "Please write your description:"
		    read DESCRIPTION
		else
		    echo "You have chosen not to write a description"
		    DESCRIPTION=""
		fi
		;;

	# Unspecified Option
	\?)	# Issue an Error Message
		echo "Invalid Option!"
		echo "---------------------------CORRECT USAGE---------------------------"
		echo "bash git_start.sh -r <REPOSITORY NAME> -d <y for yes/anything else for no> -p <LOCAL ABSOLUTE PROJECT PATH>" 
		;;		

    esac
done

source authentication.sh

# When project path isn't specified
if [ -z "$PROJECT_PATH" ]; then
    echo "You have not provided a project path!"
    exit 1
fi		

# When repository isn't specified
if [ -z "$REPO_NAME" ]; then
    echo "Repository name is going to be set as your project folder."
    REPO_NAME=${PROJECT_PATH##*/} 
    echo "Repository Name: $REPO_NAME"
fi		



CURRENTDIR=${pwd}

USERNAME=${login_email}
GITHUB_PWD=${github_password}
GITLAB_PWD=${gitlab_password}

echo "Your login-id : $USERNAME"
echo "Your github password : $GITHUB_PWD"
echo "Your gitlab password : $GITLAB_PWD"
echo "REPO NAME : $REPO_NAME"

# -------------------------------------------------------------
echo "Press Ctrl+C if anything specified above is wrong."
echo "Go through README for instructions on correct usage."
echo "-----------------------------------------------------"
echo "If everything is correct, press Enter."
read cache
unset cache
echo "Continued!!!"




# Go to path 
cd "$PROJECT_PATH"


# Initialise the repo locally, create blank README, add and commit
git init
touch README.MD
git add README.MD
git commit -m 'Initial Commit with .sh script'


# # step 5 use github API to log the user in
curl -u ${USERNAME} https://api.github.com/user/repos -d "{\"name\": \"${REPO_NAME}\", \"description\": \"${DESCRIPTION}\"}"

# #  step 6 add the remote github repo to local repo and push
# git remote add origin https://github.com/${USERNAME}/${REPO_NAME}.git
# git push --set-upstream origin master

# # step 7 change to your project's root directory.
# cd "$PROJECT_PATH"

# echo "Done. Go to https://github.com/$USERNAME/$REPO_NAME to see." 
# echo " *** You're now in your project root. ***"