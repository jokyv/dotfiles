## All my dot files and scripts

![main_screen](./main_screen.png)

### Installing
Clone into your `$HOME/repos` directory

```bash
git clone https://github.com/jokyv/dotfiles.git ~/repos/dot
```

#### Notes for conda (depreciated) 
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
