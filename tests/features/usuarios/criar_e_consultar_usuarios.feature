#language: pt

Funcionalidade: Criar e consultar novos usuários
Eu como analista de qualidade
Desejo criar e consultar os usuários da aplicação
Para que eu possa visualizar os dados

@criar_novo_usuario
Cenario: Criar um novo usuario
Quando eu preencher o body com nome email e cargo corretamente
Então devo criar um novo usuario

@consultar_id_novo_usuario
Cenario: Consultar o id do novo usuario
Quando eu preencher o body com nome email e cargo corretamente
Então o id deste usuario deve ser unico e seguir o padrão dos usuarios anteriores

@criar_usuario_invalido
Cenario: Criar um usuario incoretamente
Quando eu criar um novo usuario usando um parametro incorreto
Então devo receber o codigo 400

@criar_usuario_nome_invalido
Cenario: criar um novo usuario com nome invalido
Quando eu preencher o body com email e cargo
Então devo receber uma mensagem de erro

@criar_usuario_email_invalido
Cenario: criar um novo usuario com email invalido
Quando eu preencher o body com nome e cargo
Então devo receber uma mensagem de erro

@criar_usuario_cargo_invalido
Cenario: criar um novo usuario com cargo invalido
Quando eu preencher o body com nome e email
Então devo receber uma mensagem de erro

@criar_usuario_nome_email_invalido
Cenario: criar um novo usuario com nome e email invalido
Quando eu preencher o body com cargo
Então devo receber uma mensagem de erro

@criar_usuario_nome_cargo_invalido
Cenario: criar um novo usuario com nome e cargo invalido
Quando eu preencher o body com email
Então devo receber uma mensagem de erro

@criar_usuario_email_cargo_invalido
Cenario: criar um novo usuario com email e cargo invalido
Quando eu preencher o body com nome
Então devo receber uma mensagem de erro

