# Monaca templates update script

1. Clone this repo: `git clone git@github.com:monaca/templates-update.git`
2. Init submodules: `git submodule update --init --recursive`
3. Run `update.sh` script:

  - Update Onsen UI lib and commit changes (without pushing): `sh update.sh onsenui`
  - Update AngularJS lib and commit changes (without pushing): `sh update.sh angular` (only for angular1 templates)
  - Push all the templates: `sh update.sh push`

Alternatively, run `git clone --recursive -j8 git@github.com:monaca/templates-update.git` to clone this repo and init its submodules simultaneously.
