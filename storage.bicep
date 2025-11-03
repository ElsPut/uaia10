resource mysa 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: saname
  location: RGLocation
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

@allowed([
  'WestEurope'
  'NorthEurope'
])
param RGLocation string = 'WestEurope'

var saname = 'sa${uniqueString(resourceGroup().id)}'

output sabloburl string = mysa.properties.primaryEndpoints.blob
