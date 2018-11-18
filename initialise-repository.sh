#!/bin/sh

# argument 1 = presentation code
# argument 2 = Project Name
# argument 3 = Repository Name


# change into working directory for presentaion and clone repository
cd ../$1
git clone git@github.com:Open-University-PG-SWEng/$3.git

# copy project files into repository folder
cp -av ../main-template/master-repository-template/Functional-Requirements.txt ./$3/$2-Requirements.txt
cp -av ../main-template/master-repository-template/NonfunctionalRequirements ./$3

# change into repository directory, add and commit files
cd ./$3
git add $2-Requirements.txt
git add NonfunctionalRequirements

git status
echo ""

read -p "Are you happy to commit changes? [y/n]" yn
case $yn in
    [Yy]* ) git commit -m "Initial Commit"; git push; break;;
    [Nn]* ) break;;
    * ) echo "Please answer yes or no.";;
esac

#change back to main directory
cd ../../main-template
echo ""




