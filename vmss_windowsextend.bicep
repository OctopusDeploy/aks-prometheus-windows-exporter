param scriptLocation string
param winvmssname string



resource vmss 'Microsoft.Compute/virtualMachineScaleSets@2021-11-01' existing = {
  name: winvmssname
}
resource vmss_extension 'Microsoft.Compute/virtualMachineScaleSets/extensions@2021-11-01' = {
  name: 'windows_exporter_dsc'

  parent: vmss

  properties: {
    autoUpgradeMinorVersion: false
    enableAutomaticUpgrade: false
    
          
    publisher: 'Microsoft.Powershell'
    settings: {
      wmfVersion: 'latest'
      configuration: {
        url: scriptLocation
        script: 'aks_setup'
        function: 'Setup'
      }
      privacy: {
      dataCollection: 'false'
      } 

    }
    suppressFailures: true
    type: 'DSC'
    typeHandlerVersion: '2.83'

    provisionAfterExtensions: [
      'vmssCSE'
      
    ]
    
    

    
  }
}
