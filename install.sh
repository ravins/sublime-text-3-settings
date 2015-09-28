#!/bin/bash
#This file is to create symlink for dotfiles in home directory
dir=~/sublime-text-3-settings
old_dir=~/sublime-text-setting-backup
symlinkPath = ~/.config/sublime-text-3/Packages/User/
echo "creating $old_dir folder for backup"
mkdir -p $old_dir
echo "......done"
files="Package Control.sublime-settings Preferences.sublime-settings goto_css_declaration.sublime-settings"

echo "changing to $dir folder"
cd $dir
echo ".......done"

#move any dotfile to backup and dotfiles folder
for file in $files
	do
		#check if file exists otherwise create blank one
		if [ ! -f $symlinkPath ];then
			echo "creating ~/.$file file"
			touch ~/.$file
		fi
		echo "moving $file in $old_dir"
		mv $symlinkPath $old_dir
		echo "creating symlink"
		ln -s $dir/$file $symlinkPath
	done
