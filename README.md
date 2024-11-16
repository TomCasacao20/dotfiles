# My dotfiles

This directory contains my dotfiles

## Requirements

Make sure you have this installed

### Git

'''
apt install git
'''

### Stow

'''
apt install stow
'''

## Installation

First, check out the dotfiles repo in your ~ directory using git

'''
$ git clone git@github.com:TomCasacao20/dotfiles.git
$ cd dotfiles
'''

then use GNU stow to create symlinks

'''
$ stow .
'''
