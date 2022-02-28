param planName string
param planSKUName string
param planSKUCapacity int
param location string

resource appServicePlanLinux 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: planName
  location: location
  sku: {
    name: planSKUName
    capacity: planSKUCapacity
  }

  kind: 'linux'

  properties:{
    reserved:true
  }
}

output planId string = appServicePlanLinux.id 
