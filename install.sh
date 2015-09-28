#!/bin/bash
#This file is to create symlink for dotfiles in home directory
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
repositoryFolder=~/sublime-text-3-settings
backup_folder=~/sublime-text-setting-backup
symlinkPath=~/.config/sublime-text-3/Packages/User/
echo "creating $backup_folder folder for backup"
mkdir -p $backup_folder
echo "......done"
files="Package Control.sublime-settings
Preferences.sublime-settings
goto_css_declaration.sublime-settings"

echo "changing to $repositoryFolder folder"
cd $repositoryFolder
echo ".......done"

#move any dotfile to backup and dotfiles folder
for file in $files
	do
		#check if file exists otherwise create blank one
		if [ ! -f $symlinkPath ];then
			echo "creating $file file"
			touch $symlinkPath/$file
		fi
		echo "moving $file in $backup_folder"
		mv $symlinkPath/$file $backup_folder
		echo "creating symlink"
		ln -s $repositoryFolder/$file $symlinkPath
	done
IFS=$SAVEIFS