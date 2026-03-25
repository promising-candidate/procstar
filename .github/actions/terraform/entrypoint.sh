#!/bin/bash

set -e

export ARM_CLIENT_ID=${INPUT_ARM_CLIENT_ID}
export ARM_CLIENT_SECRET=${INPUT_ARM_CLIENT_SECRET}
export ARM_SUBSCRIPTION_ID=${INPUT_ARM_SUBSCRIPTION_ID}
export ARM_TENANT=${INPUT_ARM_TENANT_ID}

cd /workspace

terraform init
terraform fmt -check
terraform validate
terraform plan -out=tfplan

if [[ "${INPUT_APPLY}" == "true" ]]; then
    terraform apply -auto-approve tfplan
fi
