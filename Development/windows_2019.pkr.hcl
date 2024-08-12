packer {
  required_plugins {
    azure = {
      source  = "github.com/hashicorp/azure"
      version = ">= 1.4.2"
    }
  }
}

source "azure-arm" "example" {
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id


  // managed_image_name                = "DemoPackerImage"
  managed_image_resource_group_name = var.managed_image_resource_group_name
  shared_image_gallery_destination {
  resource_group      = var.resource_group 
  gallery_name        = var.gallery_name
  image_name          = var.image_name
  image_version       = var.image_version
  
}
  os_type                           = var.os_type
  image_publisher                   = var.image_publisher
  image_offer                       = var.image_offer
  image_sku                         = var.image_sku
  location                          = var.location
  vm_size                           = var.vm_size
  communicator                      = "winrm"
  winrm_username                    = var.winrm_username
  winrm_password                    = var.winrm_password
  winrm_timeout                     = var.winrm_timeout
  winrm_insecure                    = true
  winrm_use_ssl                     = true
}


build {
  sources = ["azure-arm.example"]
  # Provisioner to install updates and IIS (similar to nginx on Linux)
  provisioner "powershell" {
    inline = [
      "Write-Host 'Installing Updates'",
      "Install-WindowsUpdate -AcceptAll -IgnoreReboot",
      "Invoke-WebRequest -Uri https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.5.6/npp.8.5.6.Installer.exe -OutFile C:\\Windows\\Temp\\npp_installer.exe",
      "Write-Host 'Installing IIS'",
      "Install-WindowsFeature -name Web-Server -IncludeManagementTools"
    ]
  }
  // provisioner "powershell" {
  //   inline = [
  //     "Write-Host 'Installing Azure CLI'",
  //     "Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile AzureCLI.msi",
  //     "Start-Process msiexec.exe -ArgumentList '/I AzureCLI.msi /quiet' -Wait",
  //     "Remove-Item -Force AzureCLI.msi"
  //   ]
  // }
}
