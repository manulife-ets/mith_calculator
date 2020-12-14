#!/bin/bash
set -o errexit
set -x

# Get Commit-SHA
cd ../..
pwd
commitsha=`git rev-parse HEAD`
#download CodeQL- runner
cd ..
wget https://github.com/github/codeql-action/releases/download/codeql-bundle-20200826/codeql-runner-linux
chmod +x codeql-runner-linux
#Init and Analyze
cd source
ls
../codeql-runner-linux init --repository manulife-ets/mith_calculator --github-url https://github.com  --github-auth b6bbe465b565994fbd8c4cef4af6f4a737f83228
../codeql-runner-linux analyze --repository manulife-ets/mith_calculator --github-url https://github.com --github-auth b6bbe465b565994fbd8c4cef4af6f4a737f83228 --ref refs/heads/ghas --commit "$commitsha"

# cd source

# curl -s https://artifactory.platform.manulife.io/artifactory/bin-local/provisioning-cli/provisioning-cli-latest.linux.tar.bz2 | tar -xvz

# ./provisioning-cli config set-api provisioning.platform.manulife.io
# set +x
# ./provisioning-cli config set-token $API_TOKEN
# set -x
# ./provisioning-cli config set-org GSD-CAC-DEV
# ./provisioning-cli config set-space GEES-CAC-DEV
# ./provisioning-cli config set-foundation CAC

# ./provisioning-cli service create \
#     --name "newrelic-svc" \
#     --serviceName "newrelic" \
#     --planName "NewRelic-APM-PREPROD" 

# ./provisioning-cli app push \
#     --appName "node-demo-app" \
#     --manifestFile 'src/manifest-dev.yml' \
#     --sourcePath "src" \
#     --framework "node"