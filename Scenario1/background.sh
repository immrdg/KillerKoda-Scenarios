#!/bin/bash
# Create ubuntu user if it doesn't exist
if ! id ubuntu &>/dev/null; then
    useradd -m -s /bin/bash ubuntu
    echo "ubuntu:ubuntu" | chpasswd
fi

# Change root password
echo "root:ubuntu" | chpasswd

# Create personalized welcome message for ubuntu user
cat > /home/ubuntu/.bashrc << 'BASHRC'
echo ""
echo "=========================================="
echo "  Welcome to Basic Linux Scenario!"
echo "  Login as 'root' with password 'ubuntu'."
echo ""

echo "=========================================="
echo ""
echo "Type 'help' for available commands."
echo ""
BASHRC

chown ubuntu:ubuntu /home/ubuntu/.bashrc

# Launch the terminal as ubuntu user
su - ubuntu
