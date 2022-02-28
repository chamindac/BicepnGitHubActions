targetScope='subscription'
param rgName string = 'rg-bicepdemo01'
param rgLocation string = 'eastus'

param planName string = 'plan-bicepdemo01'
param planSKUName string = 'B3'
param planSKUCapacity int = 1

param webAppName string = 'app-bicepdemo01'
param webAppLinuxFxVersion string = 'node|14-lts'


resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: rgLocation
}

module webAppPlan 'pricingplanlinux.bicep' = {
  name: 'webAppPlan'
  scope:resourceGroup
  params:{
    location:rgLocation
    planName:planName
    planSKUCapacity:planSKUCapacity
    planSKUName:planSKUName
  }
}

module webApp 'webapplinux.bicep' = {
  name: 'webApp'
  scope:resourceGroup
  params:{
    location:rgLocation
    planId:webAppPlan.outputs.planId
    webAppLinuxFxVersion:webAppLinuxFxVersion
    webAppName:webAppName
  }
}
