targetScope = 'subscription'

@description('Name of the Resource Group')
param rgName string = 'rg-dev-infra'

@description('Location for all resources')
param location string = 'eastus'

//
// Create Resource Group
//
module rg './modules/resource-group.bicep' = {
	name: 'rg-deploy'
	params: {
		rgName: rgName
		location: location
	}
}

//
// Deploy Key Vault
//
module kv './modules/keyvault.bicep' = {
	name: 'kv-deploy'
	scope: resourceGroup(rgName)
	params: {
		kvName: 'kv-dev-${uniqueString(rgName)}'
		location: location
	}
}

//
// Deploy Managed Identity
//
module mi './modules/identity.bicep' = {
	name: 'mi-deploy'
	scope: resourceGroup(rgName)
	params: {
		identityName: 'mi-dev-infra'
		location: location
	}
}
