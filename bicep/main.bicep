param env string
param region string
param regionShort string

var rgName = 'rg-${env}-${regionShort}'
var kvName = 'kv-${env}-${regionShort}'
var identityName = 'id-${env}-${regionShort}'

module rg './modules/resource-group.bicep' = {
	name: 'rg'
	scope: subscription()
	params: {
		rgName: rgName
		location: region
	}
}

module kv './modules/keyvault.bicep' = {
	name: 'kv'
	scope: resourceGroup(rg.outputs.name)
	params: {
		kvName: kvName
		location: region
	}
}

module identity './modules/identity.bicep' = {
	name: 'identity'
	scope: resourceGroup(rg.outputs.name)
	params: {
		identityName: identityName
		location: region
	}
}
