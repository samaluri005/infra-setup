param identityName string
param location string

resource uai 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: identityName
  location: location
}

output name string = uai.name
output principalId string = uai.properties.principalId
}

output id string = mi.id
