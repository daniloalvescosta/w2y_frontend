### Sobre o W2Y
O W2Y ou **"WebScrapping2You"** é um projeto focado em realizar webscrapping da webmotors, este projeto é dividido em quatro partes, sendo o repositório atual uma delas.

### Outros microsservicos

 - 🔒Microsservice de autenticação:
https://github.com/daniloalvescosta/w2y_auth_service

- 👾Microsservice de webscrapping:
https://github.com/daniloalvescosta/w2y_webscraping_service

- 💡Microsservice de notificação:
https://github.com/daniloalvescosta/w2y_notification_service

- 🎨Front-end:
https://github.com/daniloalvescosta/w2y_frontend

### Documentação e Collections 🤓
- A documentação do projeto pode ser encontrada aqui: 
https://w2y.readme.io/docs/getting-started
- Já a collection do Postman pode ser baixada aqui: https://github.com/daniloalvescosta/w2y_frontend/blob/main/W2Y.postman_collection.json

### Como Executar o projeto? 🤔
Para rodar o Microsservice é simples, basta executar os comandos abaixo:

    docker compose build
    docker compose up


Caso queira rodar a suit de testes individualmente:

    docker-compose run --rm test

Caso queira rodar as migrations individualmente:

	docker compose exec web rails db:create
	docker compose exec web rails db:migrate
