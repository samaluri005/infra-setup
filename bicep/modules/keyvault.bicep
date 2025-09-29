
targetScope = 'resourceGroup'

@description('Environment name')
param env string

@description('Azure region')
param region string

@description('Region short code')
param regionShort string

resource kv 'Microsoft.KeyVault/vaults@2022-07-01' = {
	name: 'kv-${env}-${regionShort}'
	location: region
	properties: {
		sku: {
			family: 'A'
			name: 'standard'
		}
		tenantId: subscription().tenantId
		enableRbacAuthorization: true
	}
}

output kvName string = kv.name
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
