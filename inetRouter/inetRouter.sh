apt install ifupdown -y
apt install traceroute -y
touch /etc/iptables_rules.ipv4
cp /vagrant/inetRouter/inetRouter_iptables /etc/network/if-up.d/iptables
chmod +x /etc/network/if-up.d/iptables
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables-save > /etc/iptables_rules.ipv4
echo "net.ipv4.conf.all.forwarding = 1" >> /etc/sysctl.conf
sysctl -p

