
targetScope = 'resourceGroup'

param kvName string
param location string

resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = {
	name: kvName
	location: location
	properties: {
		enableRbacAuthorization: true
		sku: {
			name: 'standard'
			family: 'A'
		}
		tenantId: subscription().tenantId
	}
}

output name string = kv.name
param env string
param region string
param regionShort string
param rgName string

var kvName = 'kv-auth-${env}-${regionShort}'

resource kv 'Microsoft.KeyVault/vaults@2022-07-01' = {
	name: kvName
	location: region
	resourceGroup: rgName
	properties: {
		tenantId: subscription().tenantId
		sku: {
			family: 'A'
			name: 'standard'
		}
		accessPolicies: []
		enabledForDeployment: true
		enabledForTemplateDeployment: true
	}
}

output name string = kv.name
