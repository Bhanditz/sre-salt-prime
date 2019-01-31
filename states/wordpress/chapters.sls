{% set DOCROOT = "/var/www/chapters" -%}

# DIR STRUCTURE:
# wp-content/
# wp/
# index.php
# wp-config.php


include:
  - wordpress


{{ sls }} docroot:
  file.directory:
    - name: {{ DOCROOT }}
    - mode: '0555'
    - require:
      - mount: mount mount /var/www


{{ sls }} dir wp-content:
  file.directory:
    - name: {{ DOCROOT }}/wp-content
    - mode: '2775'
    - group: www-data
    - require:
      - file: {{ sls }} docroot
    - require_in:
      - composer: {{ sls }} composer update


{#
{{ sls }} dir wp-content/vendor:
  file.directory:
    - name: {{ DOCROOT }}/wp-content/vendor
    - mode: '2775'
    - group: www-data
    - require:
      - file: {{ sls }} dir wp-content
    - require_in:
      - composer: {{ sls }} composer update
#}


{{ sls }} dir wp:
  file.directory:
    - name: {{ DOCROOT }}/wp
    - mode: '2775'
    - group: www-data
    - require:
      - file: {{ sls }} docroot
    - require_in:
      - composer: {{ sls }} composer update


{{ sls }} composer.json:
  file.managed:
    - name: {{ DOCROOT }}/composer.json
    - source: salt://wordpress/files/chapters_composer.json
    - require:
      - file: {{ sls }} docroot
    - require_in:
      - composer: {{ sls }} composer update


{{ sls }} composer.lock:
  file.managed:
    - name: {{ DOCROOT }}/composer.lock
    - contents:
      - '{}'
    - replace: False
    - mode: '0664'
    - group: www-data
    - require:
      - file: {{ sls }} docroot
    - require_in:
      - composer: {{ sls }} composer update


{{ sls }} composer update:
  composer.update:
    - name: {{ DOCROOT }}
    - composer: /usr/local/bin/composer
    - php: /usr/bin/php
    - optimize: True
    - no_dev: True
    - user: www-data
    - composer_home: /opt/composer
    - require:
      - php_cc.composer config.json