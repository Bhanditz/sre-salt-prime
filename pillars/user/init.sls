include:
  - user.secrets


user:
  admin_groups:
    - adm
    - audio
    - cdrom
    - dialout
    - dip
    - floppy
    - netdev
    - plugdev
    - sudo
    - video
{#
 # Admins are stored in user.secrets to reduce mail harvesting. The expected
 # data structure is demonstrated below:
 #
 #  admins:
 #    arthur:
 #      id: 4242
 #      fullname: Arthur Dent
 #      mail: arthurdent@creativecommons.org
 #      shell: /bin/bash
 #      sshpub:
 #        ed25519:
 #          - arthur_ed25519_production_20190102.pub
 #        rsa:
 #          - arthur_rsa_legacy_20190102.pub
 #          - arthur_rsa_inherited_20190102.pub
 #}
