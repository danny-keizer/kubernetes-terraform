# requisite steps to prepare a dev environment 
sudo apt-get update 
sudo apt-get upgrade

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
sudo az aks install-cli
# az login
# az aks get-credentials --resource-group clsprg --name clspaks --file /mnt/i/Projects/Terraform/kubernetes-azure/config