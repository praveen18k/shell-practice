# GitHub access from local git
01. Go to home folder
    - **$ cd /c/devops-practice/shell-practice/** 
02. Create SSH key, it will create 2 new keys under c/user/username
    - ** $ ssh-keygen -f <keyname>**
03. Change privaite key extention to .pem and paste public key(.pub) in Github.
04. Create repository in GitHub and create READ.md file
05. Create folder in local laptop and open this location in git
06. First step in git 
    - $ git init
07. Second step 
    - $ git remote add origin git@github.com:praveen18k/shell-practice.git
08. Third step 
    - $ git add . ; git commit -m "Related message" ; git push origin 
09. Fourth step - pull from GitHub to VM
    - $ git pull
10. Fifth step - execute script
    - $ sh 01-Hello.sh
11. **Note** - if you want to check git configuration
    - $ cat .git/config






