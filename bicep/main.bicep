param region string = 'eastus'
param regionShort string = 'eus'
param env string = 'dev'

module rg 'modules/resource-group.bicep' = {
  name: 'rg-${env}'
  params: {
    env: env
    region: region
    regionShort: regionShort
  }
}

module kv 'modules/keyvault.bicep' = {
  name: 'kv-${env}'
  params: {
    env: env
    region: region
    regionShort: regionShort
    rgName: rg.outputs.name
  }
}

module mi 'modules/identity.bicep' = {
  name: 'mi-${env}'
  params: {
    env: env
    region: region
    regionShort: regionShort
    rgName: rg.outputs.name
  }
}
