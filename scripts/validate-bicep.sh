#!/bin/bash
# validate-bicep.sh
# Script to validate Bicep files
set -e

echo "Validating Bicep files..."
az bicep build --file bicep/main.bicep
