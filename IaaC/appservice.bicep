param location string = resourceGroup().location // Location for all resources

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'AppServicePlanDevOpsDemo'
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: 'S1'
    capacity: 2
  }
  kind: 'linux'
}

resource webApplication 'Microsoft.Web/sites@2018-11-01' = {
  name: 'AppServiceWebAppDevOpsDemo'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
  kind: 'app,linux,container'
}

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: 'PoCSkillingUpContainerRegistry'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}
