#!/bin/bash

# Workshop Setup Script
# This script helps participants set up their environment for the workshop

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Workshop configuration
WORKSHOP_NAME="[Your Workshop Name]"
REQUIRED_NODE_VERSION="14.0.0"
REQUIRED_PYTHON_VERSION="3.8"

echo "========================================"
echo "  Welcome to $WORKSHOP_NAME Setup"
echo "========================================"
echo ""

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to compare versions
version_compare() {
    if [[ $1 == $2 ]]; then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    for ((i=0; i<${#ver1[@]}; i++)); do
        if [[ -z ${ver2[i]} ]]; then
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]})); then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]})); then
            return 2
        fi
    done
    return 0
}

# Check operating system
echo "Checking operating system..."
OS="$(uname -s)"
case "${OS}" in
    Linux*)     OS_TYPE=Linux;;
    Darwin*)    OS_TYPE=Mac;;
    CYGWIN*)    OS_TYPE=Windows;;
    MINGW*)     OS_TYPE=Windows;;
    *)          OS_TYPE="UNKNOWN:${OS}"
esac
echo -e "${GREEN}✓${NC} Operating System: $OS_TYPE"

# Check Git
echo -e "\nChecking Git installation..."
if command_exists git; then
    GIT_VERSION=$(git --version | awk '{print $3}')
    echo -e "${GREEN}✓${NC} Git $GIT_VERSION is installed"
else
    echo -e "${RED}✗${NC} Git is not installed"
    echo "  Please install Git from: https://git-scm.com/"
    exit 1
fi

# Check Node.js (if required)
echo -e "\nChecking Node.js installation..."
if command_exists node; then
    NODE_VERSION=$(node -v | cut -d 'v' -f 2)
    version_compare $NODE_VERSION $REQUIRED_NODE_VERSION
    if [[ $? -le 1 ]]; then
        echo -e "${GREEN}✓${NC} Node.js $NODE_VERSION is installed"
    else
        echo -e "${YELLOW}⚠${NC} Node.js $NODE_VERSION is installed but version $REQUIRED_NODE_VERSION or higher is recommended"
    fi
    
    # Check npm
    if command_exists npm; then
        NPM_VERSION=$(npm -v)
        echo -e "${GREEN}✓${NC} npm $NPM_VERSION is installed"
    fi
else
    echo -e "${RED}✗${NC} Node.js is not installed"
    echo "  Please install Node.js from: https://nodejs.org/"
fi

# Check Python (if required)
echo -e "\nChecking Python installation..."
if command_exists python3; then
    PYTHON_VERSION=$(python3 --version | awk '{print $2}')
    version_compare $PYTHON_VERSION $REQUIRED_PYTHON_VERSION
    if [[ $? -le 1 ]]; then
        echo -e "${GREEN}✓${NC} Python $PYTHON_VERSION is installed"
    else
        echo -e "${YELLOW}⚠${NC} Python $PYTHON_VERSION is installed but version $REQUIRED_PYTHON_VERSION or higher is recommended"
    fi
else
    echo -e "${RED}✗${NC} Python 3 is not installed"
    echo "  Please install Python from: https://www.python.org/"
fi

# Check Docker (if required)
echo -e "\nChecking Docker installation..."
if command_exists docker; then
    DOCKER_VERSION=$(docker --version | awk '{print $3}' | sed 's/,//')
    echo -e "${GREEN}✓${NC} Docker $DOCKER_VERSION is installed"
    
    # Check if Docker is running
    if docker info >/dev/null 2>&1; then
        echo -e "${GREEN}✓${NC} Docker daemon is running"
    else
        echo -e "${YELLOW}⚠${NC} Docker is installed but not running"
        echo "  Please start Docker Desktop"
    fi
else
    echo -e "${YELLOW}⚠${NC} Docker is not installed (optional)"
    echo "  Install from: https://www.docker.com/"
fi

# Clone workshop repository
echo -e "\nSetting up workshop repository..."
if [ -d "workshop-exercises" ]; then
    echo -e "${YELLOW}⚠${NC} Workshop directory already exists"
    read -p "Do you want to update it? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cd workshop-exercises
        git pull origin main
        cd ..
        echo -e "${GREEN}✓${NC} Workshop repository updated"
    fi
else
    echo "Cloning workshop repository..."
    git clone https://github.com/[your-org]/[workshop-repo].git workshop-exercises
    echo -e "${GREEN}✓${NC} Workshop repository cloned"
fi

# Install dependencies
echo -e "\nInstalling dependencies..."
cd workshop-exercises

# Node.js dependencies
if [ -f "package.json" ]; then
    echo "Installing Node.js dependencies..."
    npm install
    echo -e "${GREEN}✓${NC} Node.js dependencies installed"
fi

# Python dependencies
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies..."
    pip3 install -r requirements.txt
    echo -e "${GREEN}✓${NC} Python dependencies installed"
fi

# Run verification script
echo -e "\nRunning verification..."
if [ -f "scripts/verify-setup.sh" ]; then
    bash scripts/verify-setup.sh
else
    echo -e "${YELLOW}⚠${NC} No verification script found"
fi

# Final message
echo -e "\n========================================"
echo -e "${GREEN}  Setup Complete!${NC}"
echo "========================================"
echo ""
echo "Next steps:"
echo "1. cd workshop-exercises"
echo "2. Review the README.md file"
echo "3. Start with Exercise 01"
echo ""
echo "If you encounter any issues, please:"
echo "- Check the troubleshooting guide"
echo "- Ask in the workshop chat"
echo "- Contact the facilitator"
echo ""
echo "Happy learning!"
