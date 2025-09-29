targetScope = 'subscription'

@description('Environment name, e.g. dev, sit, prod')
param env string

@description('Azure region for resources')
param region string = 'eastus'

@description('Short name for region')
param regionShort string = 'eus'

// ===== Resource Group =====
module rg 'modules/resource-group.bicep' = {
	name: 'rg-${env}-${regionShort}'
	scope: subscription()
	params: {
		env: env
		region: region
		regionShort: regionShort
	}
}

// ===== Key Vault =====
module kv 'modules/keyvault.bicep' = {
	name: 'kv-${env}-${regionShort}'
	scope: resourceGroup(rg.outputs.rgName)
	params: {
		env: env
		region: region
		regionShort: regionShort
	}
}

// ===== Managed Identity =====
module identity 'modules/identity.bicep' = {
	name: 'mi-${env}-${regionShort}'
	scope: resourceGroup(rg.outputs.rgName)
	params: {
		env: env
		region: region
		regionShort: regionShort
	}
}
