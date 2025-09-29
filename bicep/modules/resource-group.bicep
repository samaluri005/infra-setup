
targetScope = 'subscription'

param rgName string
param location string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
	name: rgName
	location: location
}

output name string = rg.name
param env string
param region string
param regionShort string

var rgName = 'rg-auth-${env}-${regionShort}'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
	name: rgName
	location: region
}

output name string = rg.name
