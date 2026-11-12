TASK_2 Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

Задание 1

1.4
- В platform_id: было "standart-v4", стало "standard-v3" - провайдер не примет букву t на конце вместо d, а еще v4 такой платформы нет, нашла в документации https://yandex.cloud/ru/docs/compute/concepts/vm-platforms
- Добавила в yandex_compute_instance: zone, т. к. без явного указания зоны инстанс может попытаться создаться не там, где подсеть и упасть с ошибкой; hostname = "netology-develop-platform-web", чтоб у VM было логичное название,а не набор символов
- Подняла ресурсы VM: cores с 1 на 2, memory с 1 на 2, core_fraction с 5 на 20, самые минимальные значения cores 2, memory 2, core_fraction 20 - другие просто не принимает, потому что я поставила standard-v3, чтоб развернуть VM по минимальным ресурсам 2,1,5, надо было ставить standard-v2/v1, и то там нигде нельзя поставить cores 1, минимальное значение = 2.
- Добавила параметры диска: type = "network-hdd" и size = 10, HDD выбрала, потому что он значительно дешевле SSD, а для тестовой среды высокая скорость диска не критична

<img width="1766" height="264" alt="image" src="https://github.com/user-attachments/assets/d8430116-7363-409d-b0d4-12d90a550961" />

1.5

<img width="754" height="348" alt="image" src="https://github.com/user-attachments/assets/37dd5580-19c0-429f-8cb6-fee5418994a9" />

1.6
- preemptible = true: Это параметр нужен, чтоб VM была прерываемая, то есть работала 24 часа, а потом выключалась, это очень экономит деньги за VM в месяц
- core_fraction=5: Этот параметр ограничивает производительность процессора до 5% от одного ядра, что собственно опять очень экономит деньги, и для учебы это подойдет


Задание 2

<img width="1115" height="963" alt="image" src="https://github.com/user-attachments/assets/94f9050a-adef-4999-abad-5757fc6e33a4" />

Задание 3

<img width="827" height="328" alt="image" src="https://github.com/user-attachments/assets/fefde51e-8be8-4090-9018-bfb7189d8d83" />

<img width="1782" height="317" alt="image" src="https://github.com/user-attachments/assets/6d857e9e-6f2f-4fa9-be0b-d0be967704ce" />

Задание 4

<img width="751" height="344" alt="image" src="https://github.com/user-attachments/assets/8d3db325-a54d-4330-9320-419fcdbc74e4" />

Задание 5

<img width="962" height="343" alt="image" src="https://github.com/user-attachments/assets/8ccc79cf-bc14-4098-9c0b-4f1d3fc262df" />

Задание 6

<img width="1144" height="945" alt="image" src="https://github.com/user-attachments/assets/12a1356b-b2f0-414a-ab4f-1c391cbd0e73" />
