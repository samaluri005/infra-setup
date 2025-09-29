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
