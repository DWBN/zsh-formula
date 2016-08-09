{% for name, user in pillar.get('zsh', {}).items() %}
{%- if user == None -%}
{%- set user = {} -%}
{%- endif -%}
{%- set home = user.get('home', "/home/%s" % name) %}

oh_my_zsh_{{ name }}:
  git.latest:
    - name: git://github.com/robbyrussell/oh-my-zsh.git
    - rev: master
    - target: {{ home }}/.oh-my-zsh
    - require:
      - pkg: zsh
    - force_clone: true
    - user: {{ name }}
    - unless: cd {{ home }}/.oh-my-zsh && git stash



{% endfor %}
