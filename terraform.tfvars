# AKS Cluster settings
clusterName = "clsp"
nodes       = 2
diskSize    = 30 
sku         = "Standard_B2s"
region      = "West Europe"

# Kubernetes Resources
nsName      = "clsp"
appName     = "clsp-app"
cpuRequest  = "0.5"
cpuLimit    = "0.8"
ramRequest  = "256Mi"
ramLimit    = "512Mi"
