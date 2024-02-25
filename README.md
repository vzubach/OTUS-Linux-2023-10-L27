### OTUS-Linux-2023-10-L27 | Подготовка сетевого стэнда

В репозитории Vagrantfile и необходимое для его работы окружение.  
В процессе разворачивания машин происходит настройка правил iptables и маршрутизации.  
Работоспособность сохраняется после перезагрузки стэнда.  
Для проверки прилагаю вывод команды traceroute с самой удалённой по схеме машины:  

		root@office2Server:~# traceroute -n 1.1.1.1
		traceroute to 1.1.1.1 (1.1.1.1), 30 hops max, 60 byte packets
		 1  192.168.1.1  0.511 ms  0.456 ms  0.542 ms
		 2  192.168.255.5  0.841 ms  0.800 ms  0.857 ms
		 3  192.168.255.1  1.492 ms  1.302 ms  1.644 ms
		 4  * * *
		 5  * * *
		 6  * * *
		 7  * * *
		 8  212.188.1.5  5.040 ms * *
		 9  * * 212.188.28.148  4.940 ms
		10  * * *
		11  212.188.56.14  5.042 ms  5.017 ms  4.152 ms
		12  212.188.33.197  31.779 ms * *
		13  1.1.1.1  26.106 ms *  46.777 ms
		root@office2Server:~#  

Трассировка проходит через три промежуточных хопа на стэнде: office2Router --> centralRouter --> inetRouter

#####Используемые сети следующие:

192.168.2.0/26 - dev - содержит: 62 хостовых адреса, broadcast: .63  
192.168.2.64/26 - test servers - содержит: 62 хостовых адреса, broadcast: .127  
192.168.2.128/26 - managers - содержит: 62 хостовых адреса, broadcast: .191  
192.168.2.192/26 - office hardware - содержит: 62 хостовых адреса, broadcast: .255  

#####Сеть office2  
192.168.1.0/25 - dev - содержит: 126 хостовых адресов, broadcast: .127  
192.168.1.128/26 - test servers - содержит: 62 хостовых адреса, broadcast: .191  
192.168.1.192/26 - office hardware - содержит: 62 хостовых адреса, broadcast: .255  

#####Сеть central  
192.168.0.0/28 - directors - содержит: 14 хостовых адреса, broadcast: .15  
192.168.0.16/28 - свободная  
192.168.0.32/28 - office hardware - содержит: 14 хостовых адреса, broadcast: .47  
192.168.0.48/28 - свободная  
192.168.0.64/26 - wifi - содержит: 62 хостовых адреса, broadcast: .127  
192.168.0.128/25 - свободная
