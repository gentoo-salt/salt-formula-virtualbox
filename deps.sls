{% set license_file = '/etc/portage/package.license/all' %}

update-license:
  file.replace:
    - name: {{ license_file }}
    - pattern: .*app-emulation/virtualbox-extpack-oracle.*
    - repl: app-emulation/virtualbox-extpack-oracle PUEL
    - append_if_not_found: True

#{% for item in [{'':'m','':'y','':'y'}] %}
#  {% for option, value in item.iteritems() %}
#    {{ option }}:
#      module.run:
#        - name: kernel.is_option_set_to
#        - option: {{ option }}
#        - value: {{ value }}
#  {% endfor %}

{% endfor %}
