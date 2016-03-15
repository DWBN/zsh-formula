include:
  - zsh.oh-my-zsh
  - zsh.conf

zsh:
  pkg.installed:
  - require:
    - sls: users
