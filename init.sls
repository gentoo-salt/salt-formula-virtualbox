{% if grains['os'] == 'Gentoo' %}

include:
  - virtualbox.deps

{% set keywords_file = '/etc/portage/package.accept_keywords/all' %}

{% for pkg in 'app-emulation/virtualbox','app-emulation/virtualbox-additions','app-emulation/virtualbox-extpack-oracle','app-emulation/virtualbox-modules' %}
keyword-{{ pkg }}:
  file.replace:
    - name: {{ keywords_file }}
    - pattern: .*{{ pkg }}$
    - repl: {{ pkg }}
    - append_if_not_found: True
{% endfor %}

{% for pkg in 'app-emulation/virtualbox','app-emulation/virtualbox-extpack-oracle' %}
package-{{ pkg }}:
  pkg.latest:
    - pkgs:
      - {{ pkg }}
{% endfor %}

{% endif %}
