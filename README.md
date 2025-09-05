# big_app

A new Flutter project.

## Getting Started

Para inicializar o projeto, corri o comando *flutter clean && flutter pub get && flutter run* num terminal de linux.

API usada é pública e chama-se DummyJSON. O site para a página da API é https://dummyjson.com. Usei o conjunto de utilizadores fornecidos pela aplicação para efetuar o login para o dashboard bem como guardei tokens de autenticação para manter a sessão do utilizador.

Alguns exemplos de utilizadores/passowrds para iniciar sessão:
michaelw / michaelwpass
emilys / emilyspass
sophiab / sophiabpass

Para a estrutura do meu programa, usei diretorias para organizar cada página da aplicação, uma diretoria user que gere os fetches à base de dados e uma diretoria common com constantes e as page routes a serem usadas pelo go_route.
