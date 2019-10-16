##! /bin/bash
# Importation des modules
modprobe ip_tables
modprobe ip_nat_ftp
modprobe ip_nat_irc
modprobe ip_table_nat
modprobe ip_conntract_ftp

# Suppression des entrees de cache
iptables -t filter -F
iptables -t filter -X
iptables -t filter -F INPUT
iptables -t filter -F OUTPUT
iptables -t filter -F FORWARD
iptables -t nat -F PREROUTING

# Définition de la politique par defaut
iptables -t filter -P INPUT -j DROP
iptables -t filter -P FORWARD -j DROP
iptables -t filter -P OUTPUT -j ACCEPT

#Gestion des flux encours
iptables -t filter -A INPUT -m state --state NEW,ETABLISHED,RELATED -j ACCEPT

