for ver in 7.4 8.0 8.1 8.2 8.4; do
    sudo mkdir -p /etc/systemd/system/php${ver}-fpm.service.d/
    sudo bash -c "cat > /etc/systemd/system/php${ver}-fpm.service.d/override.conf << EOF
[Service]
Type=simple
EOF"
done
sudo systemctl daemon-reload

for ver in 7.4 8.0 8.1 8.2 8.4; do
    sudo phpdismod -v ${ver} snmp 2>/dev/null
done
