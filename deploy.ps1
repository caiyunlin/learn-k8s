# deploy kubernetes resources

# Set the current directory to the directory of the script
$scriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$scriptPath = ""

kubectl apply -f $scriptPath\src\01_pod.yaml
