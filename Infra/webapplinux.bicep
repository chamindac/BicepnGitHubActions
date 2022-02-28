param planId string
param webAppName string
param webAppLinuxFxVersion string
param location string

resource webApplicationLinux 'Microsoft.Web/sites@2018-11-01' = {
  name: webAppName
  location: location
  
  properties: {
    serverFarmId: planId
    siteConfig:{
      linuxFxVersion:webAppLinuxFxVersion
    }
  }
}
