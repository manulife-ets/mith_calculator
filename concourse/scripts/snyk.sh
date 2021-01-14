#!/bin/bash

set -o errexit

cd source
pwd

gradle -v

# specific for NPM projects, to generate the package-lock.json file
npm install

# set the snyk token for authentication and monitor purposes
snyk auth $SNYK_TOKEN

# test for vulnerabilities and show result on standard output
snyk test

# send manifest to snyk.io for visualization and subscribe for alerts on any new vulnerability discovered
snyk monitor