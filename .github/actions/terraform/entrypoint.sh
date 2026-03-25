#!/bin/bash

set -e

export ARM_CLIENT_ID=${INPUT_ARM_CLIENT_ID}
export ARM_CLIENT_SECRET=${INPUT_ARM_CLIENT_SECRET}
export ARM_SUBSCRIPTION_ID=${INPUT_ARM_SUBSCRIPTION_ID}
export ARM_TENANT=${INPUT_ARM_TENANT_ID}

cd /github/workspace
ls -al

terraform init
terraform fmt -check
terraform validate
terraform plan -out=tfplan -var "commenter=${INPUT_COMMENTER}"
echo "${INPUT_COMMENTER}"

terraform apply -auto-approve tfplan
