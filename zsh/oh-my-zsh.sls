{% for name, user in pillar.get('zsh', {}).items() %}
{%- if user == None -%}
{%- set user = {} -%}
{%- endif -%}
{%- set home = user.get('home', "/home/%s" % name) %}

oh_my_zsh_{{ name }}:
  git.latest:
    - name: git://github.com/robbyrussell/oh-my-zsh.git
    - rev: master
    - force_reset: True
    - target: {{ home }}/.oh-my-zsh
    - require:
      - pkg: zsh
  file.directory:
    - name: {{ home }}/.oh-my-zsh
    - dir_mode: 755
    - file_mode: 755
    - user: {{ name }}
    - group: {{ name }}
    - recurse:
      - mode
      - user
      - group
    - require:
      - git: oh_my_zsh_{{ name }}

{% endfor %}
