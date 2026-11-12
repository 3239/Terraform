Скачала и установила terraform

<img width="601" height="98" alt="image" src="https://github.com/user-attachments/assets/86a76616-0224-4102-9ce5-6d7807ebfdb6" />

1.1 Установила все зависимости

<img width="735" height="715" alt="image" src="https://github.com/user-attachments/assets/daa03b0f-1eeb-45f7-a9b6-3aa4756829f3" />

1.2 Личную и секретную информацию допустимо сохранить в файле personal.auto.tfvars, на это указывает комментарий

1.3 Значение "result": "p5GHvqvd7sqSB5iH"

<img width="1314" height="787" alt="image" src="https://github.com/user-attachments/assets/372a2105-dc01-4fae-88a1-fc618be2869d" />

1.4 Первая ошибка "All resource blocks must have 2 labels (type, name)" - У блока resource должно быть 2 значения, тип ресурса и его имя, а здесь указан только тип "docker_image", а имени нет.
Вторая ошибка -  имя ресурса не может начинаться с цифры, надо переименовать "1nginx"
Третья ошибка в ресурсе "docker_conteiner" есть неверная ссылка на random_password "name  = "example_${random_password.random_string_FAKE.resulT}", random_string_FAKE - неверное имя, верное random_string, также result, на конце маленькая T

<img width="1001" height="148" alt="image" src="https://github.com/user-attachments/assets/75ec3950-f073-460e-bf58-a2d5ae8137f5" />

1.5

<img width="583" height="692" alt="image" src="https://github.com/user-attachments/assets/696b5ef3-e9b0-4acc-85ff-808329a0ca9f" />

<img width="1012" height="442" alt="image" src="https://github.com/user-attachments/assets/ce88e91a-ecdc-48eb-bdd9-5071b0628cc6" />

1.6 При выполнении команды terraform apply, terraform показывает все, что будет изменено, а потом мы воодим "yes", чтоб подтвердить, при добавлении ключа -auto-approve, подтверждения не нужно, все выполняется без него. Это соответственно может привести к необратимым последствиям, что у тебя ляжет вся инфра.
Пригодится этот ключ может там, где процесс автоматизирован и работает без тебя, например скрипты или пайплайны

<img width="1143" height="846" alt="image" src="https://github.com/user-attachments/assets/3954819b-d7b2-47b8-9b92-9f900bf2fd8e" />

1.7

<img width="543" height="260" alt="image" src="https://github.com/user-attachments/assets/c51fc455-918c-4d34-969d-4ea36d2e5ed0" />

1.8 Image docker не удален потому что используется параметр "keep_locally = true" в ресурсе "docker_image", который говорит, что при уничтожении всей инфры, образ оставь на месте.

<img width="602" height="419" alt="image" src="https://github.com/user-attachments/assets/dae1a821-0761-449b-a803-11b47b2b29d1" />

<img width="1388" height="777" alt="image" src="https://github.com/user-attachments/assets/699ec833-c572-4581-abb9-4eaf53998959" />





