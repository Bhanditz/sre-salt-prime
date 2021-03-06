{% import "apache2/jinja2.sls" as a2 with context -%}

{% set SERVER_NAME = "pmwiki.creativecommons.org" -%}
{% set LE_CERT_PATH = ["/etc/letsencrypt/live", SERVER_NAME]|join("/") -%}
{% set SITES_DISABLE = ["000-default.conf", "default-ssl.conf"] -%}


include:
  - apache2


{{ sls }} installed packages:
  pkg.installed:
    - pkgs:
      - php-ldap
    - watch_in:
      - service: apache2 service


{{ a2.disable_sites(sls, SITES_DISABLE) }}


{{ sls }} pmwiki site config file:
  file.managed:
    - name: /etc/apache2/sites-available/{{ SERVER_NAME }}.conf
    - source: salt://apache2/files/{{ SERVER_NAME }}.conf
    - template: jinja
    - defaults:
        LE_CERT_PATH: {{ LE_CERT_PATH }}
        SERVER_NAME: {{ SERVER_NAME }}
    - require:
      - file: pmwiki symlink pmwiki dir
      - pkg: apache2 installed packages
      - pkg: {{ sls }} installed packages
      # from letsencrypt/domains.sls
      - cmd: create-fullchain-privkey-pem-for-{{ SERVER_NAME }}
    - watch_in:
      - service: apache2 service


{{ sls }} enable site pmwiki:
  apache_site.enabled:
    - name: {{ SERVER_NAME }}
    - require:
      - file: {{ sls }} pmwiki site config file
    - watch_in:
      - service: apache2 service
