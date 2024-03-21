# Git connectivity to GitHub
1. Go to home folder
    $ cd /c/devops-practice/shell-practice/ 
2. Create SSH key, it will create 2 new keys under c/user/username
    $ ssh-keygen -f <keyname>
3. Change privaite key extention to .pem and paste public key(.pub) in Github.
4. Create repository in GitHub and create READ.md file
5. Create folder in local laptop and open this location in git
6. First step in git 
    $ git init
7. Second step 
    $ git remote add origin git@github.com:praveen18k/shell-practice.git
8. Third step 
    $ git add . ; git commit -m "Related message" ; git push origin master
    # Noteif you want to check git configuration
        $ cat .git/config






