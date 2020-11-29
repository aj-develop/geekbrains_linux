# 3. Настроить iptables: разрешить подключения только на 22-й и 80-й порты.

# правила входящих соединений
root@alex-ubuntu:~# iptables -A INPUT -i lo -j ACCEPT
root@alex-ubuntu:~# iptables -A INPUT -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
root@alex-ubuntu:~# iptables -A INPUT -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT
root@alex-ubuntu:~# iptables -A INPUT -i enp0s3 -p tcp -m tcp --dport 22 -j ACCEPT
root@alex-ubuntu:~# iptables -A INPUT -i enp0s3 -p tcp -m tcp --dport 80 -j ACCEPT
root@alex-ubuntu:~# iptables -A INPUT -p icmp -j ACCEPT

# Правила исходящих соединений
root@alex-ubuntu:~# iptables -A OUTPUT -o lo -j ACCEPT
root@alex-ubuntu:~# iptables -A OUTPUT -p TCP -m tcp --sport 32768:60999 -j ACCEPT
root@alex-ubuntu:~# iptables -A OUTPUT -p UDP -m udp --sport 32768:60999 -j ACCEPT
root@alex-ubuntu:~# iptables -A OUTPUT -o enp0s3 -p tcp -m tcp --sport 22 -j ACCEPT
root@alex-ubuntu:~# iptables -A OUTPUT -o enp0s3 -p tcp -m tcp --sport 80 -j ACCEPT
root@alex-ubuntu:~# iptables -A OUTPUT -p icmp -j ACCEPT

# Настраиваем политики по умолчанию
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP