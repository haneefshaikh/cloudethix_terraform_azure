// RESOURCE GROUP
rg_location = "West Europe"
rg_name     = "cloud"

// NETWORK
vnet_name       = "cloud-vnet"
web_subnet_name = "web-subnet"
db_subnet_name  = "db-subnet"
app_subnet_name = "app-subnet"

// SECURITY GROUP
web_sg_name = "web-sg"
app_sg_name = "app-sg"
db_sg_name  = "db-sg"

//NAT
public_ip_name   = "nat-public-ip"
nat_gateway_name = "app-nat-gateway"

// NIC
nic_name    = "cloud-nic"

// VM
vm_name     = "cloud-vm"
vm_type     = "Standard_DS1_v2"
vm_hostname = "vm.cloud.local"
vm_username = "adminvm"
vm_password = "admin@123"