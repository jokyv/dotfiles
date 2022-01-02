## A folder to save all my dot files and scripts

## Clone to your desktop
git clone https://github.com/jokyv/dotfiles.git ~/dot

## conda 
Download: https://docs.conda.io/en/latest/miniconda.html
- for ipython
- go to: ~/.ipython/profile_default
- ipython profile create
- go to newly created file and....
- find autoindent and make it false, delete comment
- sudo pacman _S pip3 
- conda install pylint sqlalchemy black xlsxwriter
- conda install -c conda-forge mysql-connector-python
- pip install pydomo ibm_db

## NOTES:
### bash
- bash scripts saved at the ~/dot/scripts folder
- they do not need extension .sh
- just add !/bin/sh on top of the file

### Git
- will use the .config folder by default

