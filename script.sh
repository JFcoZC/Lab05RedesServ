#!/bin/sh
echo "hola"
iptables -L
#1) Reiniciar ip tables
#Flush
#iptables -F
#iptables -X
#
#1.) Regresar politicas a accept (reiniciar contadores)
#iptables -P INPUT ACCEPT
#iptables -P OUTPUT ACCEPT
#iptables -P FORWARD ACCEPT
#
#2) Politicas a DROP de filter (reiniciar contadores)
#iptables -P INPUT DROP
#iptables -P OUTPUT DROP
#iptables -P FORWARD DROP
#
#3) Accept  all loopback interace
#iptables -A INPUT -i lo -j ACCEPT
#iptables -A OUTPUT -o lo -j ACCEPT
#
#4) INPUT:
#4.1)Tirar invalid
#iptables -A INPUT --cstate INVALID -j DROP
#4.2)Aceptar ssh
#iptables -A INPUT -p TCP --dport 22 -j ACCEPT
#4.3)Aceptar DNS
#iptables -A INPUT -p TCP --dport 53 -j ACCEPT
#iptables -A INPUT -p UDP --dport 53 -j ACCEPT
#4.4)Aceptat HTTP/HTTPS
#iptables -A INPUT -p TCP --dport 80 -j ACCEPT
#iptables -A INPUT -p TCP --dport 443 -j ACCEPT
#
#4) OUTPUT:
#4.1)Tirar invalid
#iptables -A OUTPUT --ctstate INVALID -j DROP
#4.2)Aceptar ssh
#iptables -A OUTPUT -p TCP --sport 22 -j ACCEPT
#4.3)Aceptar DNS
#iptables -A OUTPUT -p TCP --sport 53 -j ACCEPT
#iptables -A OUTPUT -p UDP --sport 53 -j ACCEPT
#4.4)Aceptat HTTP/HTTPS
#iptables -A OUTPUT -p TCP --sport 80 -j ACCEPT
#iptables -A OUTPUT -p TCP --sport 443 -j ACCEPT
#
#6) Configurar NAT
#iptables -t nat -A POSTROUTING -o 10.0.2.10 -j MASQUERADE
#iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
#iptables -A FORWARD -t nat -o 10.0.2.10 -j ACCEPT