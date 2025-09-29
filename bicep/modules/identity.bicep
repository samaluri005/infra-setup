
targetScope = 'resourceGroup'

@description('Environment name')
param env string

@description('Azure region')
param region string

@description('Region short code')
param regionShort string

resource identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
	name: 'mi-${env}-${regionShort}'
	location: region
}

output identityName string = identity.name
param env string
param region string
param regionShort string
param rgName string

var miName = 'mi-auth-${env}-${regionShort}'

resource mi 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
	name: miName
	location: region
	resourceGroup: rgName
}

output id string = mi.id
