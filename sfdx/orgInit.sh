#!/bin/sh
# Comment out the modules that you don't want to setup in your org


sh ./convert-examples-to-sfdx.sh
sfdx shane:org:create -f config/project-scratch-def.json -d 1 -s --json --userprefix int -o work.shop
sfdx force:source:push -f
sfdx force:user:permset:assign -n CustomerID
sfdx shane:user:password:set -l User -g User -p sfdx1234 --json
sh ./quickstart-create-store.sh
sh ./quickstart-setup-store.sh myFirstStore
sfdx force:org:open