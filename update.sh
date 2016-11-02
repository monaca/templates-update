#!/bin/bash

function updateOnsenui {
  libPath="www/lib/onsenui";
  npm install onsenui

  for D in */; do
    if [ $D != "node_modules/" ]; then
      echo "${D}${libPath}";
      (cd $D && git checkout master && git pull)
      rm -rf "${D}${libPath}";
      cp -r "node_modules/onsenui" "${D}${libPath}";
      (cd $D && git add -A && git commit -m "Update onsenui lib.")
    fi
  done
}

function updateAngular {
  libPath="www/lib/angular";
  npm install angular

  for D in */; do
    if [[ $D == *"-angular1-"* ]]; then
      echo "${D}${libPath}";
      (cd $D && git checkout master && git pull)
      rm -rf "${D}${libPath}";
      cp -r "node_modules/angular" "${D}${libPath}";
      (cd $D && git add -A && git commit -m "Update angular lib.")
    fi
  done
}

function gitPush {
  for D in */; do
    if [ $D != "node_modules/" ]; then
      echo "${D}";
      (cd $D && git push)
    fi
  done
}

todo=${1-onsenui}
echo $todo

case "$todo" in
  onsenui)
    updateOnsenui
    ;;
  angular)
    updateAngular
    ;;
  push)
    gitPush
    ;;
esac
