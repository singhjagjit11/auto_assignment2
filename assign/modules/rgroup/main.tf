
	
resource "azurerm_resource_group" "rgroup" {
  name     = "N01574661-assignment1-RG"
  location = "eastus"
  
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "jagjit.singh"
    Project        = "Automation Project – Assignment 1"
  }
}

