# Configure machines for Lambda Ensamble

Repository contains tools used to configure hosts for algorythmic music composition and performances for [Lambda Ensemble](lambdaensemble.com.pl)

## Usage

```console
$ ./generate-hosts.sh
$ ansible-playbook -i hosts configure.yml -v
$ ansible-playbook -i hosts play_test_notes.yml -v
```

1. Create hosts file with `generate-hosts.sh`. It will lookup all available hosts in your subnetwork and add them to hosts list for Ansible.
2. Configure with `configure.yml` playbook including:
  * Installation of Helm synthesizer
  * Installation of Musique programming language
3. Test system with `play_test_notes.yml` playbook by playing some notes using Helm & Musique
