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
    - depth: 1
    - force_checkout: true
    - force_clone: true
    - force_fetch: true
    - user: {{ name }}


{% endfor %}
