# Ansible for setting up dev environment quickly

## Build Image (Dockerfile)

- docker build -t debian-ansible .

## Build Image (debian.Dockerfile)

- docker build -t debian-ansible . -f debian.Dockerfile

## Run Image

- docker run --rm -it -v ${PWD}/playbooks:/scripts debian-ansible bash

## Run Ansible Playbook (inside docker container)

- ansible-playbook /scripts/fem.yml

## Run Ansible Playbook (inside docker container) tag

- ansible-playbook /scripts/fem.yml --tags install,dotfiles

## Ansible Pull

- ansible-pull -U www.url.to.the.ansible.local/folder

### TODO

1. Install fzf

### Sources

The Primeagen:

- (https://github.com/ThePrimeagen/ansible/blob/master/local.yml)[https://github.com/ThePrimeagen/ansible/blob/master/local.yml]
