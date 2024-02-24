### OTUS-Linux-2023-10-L27 | Подготовка сетевого стэнда

В репозитории Vagrantfile и необходимое для его работы окружение.  
В процессе разворачивания машин происходит настройка правил iptables маршрутизации.
Работоспособность сохраняется после перезагрузки стэнда.
Для проверки прилагаю вывод команды traceroute с самой удаллённой по схеме машины:
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
