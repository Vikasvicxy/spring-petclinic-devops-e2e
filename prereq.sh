#!/bin/bash

echo "Installing Git..."
sudo apt install git -y

echo "Installing Java..."
sudo apt install openjdk-17-jdk -y

echo "Installing Maven..."
sudo apt install maven -y

echo "Installing Docker..."
sudo apt install docker.io -y

echo "Installing Terraform..."
sudo apt install terraform -y

echo "Installing Azure CLI..."
sudo apt install azure-cli -y

echo "Installing ShellCheck..."
sudo apt install shellcheck -y

echo "Installing Gitleaks..."
sudo apt install gitleaks -y

echo "Installing TFLint..."
sudo apt install tflint -y

echo "Done!"

