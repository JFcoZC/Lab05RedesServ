# -*- mode: ruby -*-
# vi: set ft=ruby :

#Definir variable config
Vagrant.configure("2") do |config|
    #--- INICIO MAQUINA CLIENTE ---
      #Configurar para iniciar ssh de servidor usando: vagrant ssh cl 
      config.vm.define "cl" do |cl|
        cl.vm.box = "ubuntu/bionic64"
        cl.vm.network "private_network", ip: "10.0.2.20"
        cl.vm.provision "shell", inline: <<-SHELL
          echo "cliente" > /etc/hostname
          #Confiugrar hostname del servidor
          hostname -b cliente
          #Haciendo que dbserver pueda enconctrar al clockserver por nombre
          echo "10.0.2.10        router" >> /etc/hosts
        SHELL
      end
    #--- INICIO MAQUINA DEL ROUTER ---
      #Configurar para iniciar ssh de servidor usando: vagrant ssh rtr 
      config.vm.define "rtr" do |rtr|
        rtr.vm.box = "ubuntu/bionic64"
        rtr.vm.network "private_network", ip: "10.0.2.10"
        rtr.vm.network "public_network", type: "dhcp"
        rtr.vm.provision "shell", inline: <<-SHELL
          echo "router" > /etc/hostname
          #Confiugrar hostname del servidor
          hostname -b router
          #Haciendo que router pueda enconctrar al cliente
          echo "10.0.2.20        cliente" >> /etc/hosts
          #Ejecutar script que esta en carpeta como super usuario
          sudo bash /vagrant/script.sh
        SHELL
      end
    end