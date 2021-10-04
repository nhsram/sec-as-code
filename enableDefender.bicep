targetScope = 'subscription'
var enableSecurityCenterFor = [
  'KeyVaults'
  'SqlServers'
  'VirtualMachines'
  'StorageAccounts'  
  'SqlServerVirtualMachines'
  'AppServices'
  'Dns'
  'Arm'
]

resource securityCenterPricing 'Microsoft.Security/pricings@2018-06-01' = [for name in enableSecurityCenterFor: {
  name: name
  properties: {
    pricingTier: 'Standard'
  }
}]

//Notification Alerts from Security Center
resource securityCenterContacts 'Microsoft.Security/securityContacts@2017-08-01-preview' = {
  name: 'default'
    properties: {
      alertNotifications: 'On'
      alertsToAdmins: 'On'
      email: 'Ramakoteswara.atluri@property.nhs.uk'
      phone: '+447424769446'        
  }
}
