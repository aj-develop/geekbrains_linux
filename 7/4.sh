# Настроить проброс портов локально с порта 80 на порт 8080
root@alex-ubuntu:~# iptables -A INPUT -i enp0s3 -p tcp --dport 80 -j ACCEPT
root@alex-ubuntu:~# iptables -A INPUT -i enp0s3 -p tcp --dport 8080 -j ACCEPT
root@alex-ubuntu:~# iptables -A PREROUTING -t nat -i enp0s3 -p tcp --dport 80 -j REDIRECT --to-port 8080