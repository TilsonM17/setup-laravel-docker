# Setup Laravel Docker

Criar um ambiente de desenvolvimento com Laravel e Docker é relativamente facil, isso porque hoje temos soluções como [Laravel Sail](https://laravel.com/docs/10.x/sail), [Laradock](https://laradock.io/), entre outras soluções.

Este projecto contem um setup inicial, para voçe começar rapidamenente usando o docker e o Laravel **tanto em desenvolvimento como em produção** usando **Nginx,Postgres,PHP8.1**.

## Como usar?

Para facilitar as coisas estamos a usar o `Makefile` para nos ajudar a fazer as tarefas *Mundanas*.

     //Levantar os Containers
     make up

     //Para os Containers
     make stop
## Como rodar

> Antes de rodar o projeto  siga os seguintes passos:
 
 1- Copie o arquivo Env `cp .env.example .env`

 2 - Rodar o Comando para subir os container `make up`

 3- Acesse o container do PHP, execute `composer install`

 E pronto tem o seu projecto Laravel a funcionar.

 OBS: Na pasta `docker` contem tudo que precisa para trabalhar com o docker, esteja avontade para ajustar as suas necessidades.
