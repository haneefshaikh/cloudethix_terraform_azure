//TAG
application = "softdron"
product     = "cdex"
environment = "dev"

// RESOURCE GROUP
rg_location = "West Europe"
rg_name     = "softdrone"

// NETWORK
vnet_name       = "softdrone-vnet"
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
web_nic_name = "web-nic"
app_nic_name = "app_nic"

// VM
web_vm_name     = "softdrone-vm-web"
app_vm_name     = "softdrone-vm-app"
vm_type         = "Standard_DS1_v2"
web_vm_hostname = "web.cloud.local"
app_vm_hostname = "app.cloud.local"
vm_username     = "adminvm"
vm_password     = "admin@123"

// STORAGE ACCOUNT
storage_account_name = "softdrone-storage"
db_name              = "softdrondb"
server_name          = "softdron-server"