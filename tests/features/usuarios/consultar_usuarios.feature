#language: pt

Funcionalidade: Consulta de usuários
Eu como analista de qualidade
Desejo consultar os usuários da aplicação
Para que eu possa visualizar os dados

@consultar_todos_usuarios
Cenario: Consultar todos os usuários
Quando eu consultar os usuários através da API
Então eu devo validar que todos os usuários foram retornados

@consultar_usuario_especifico
Cenario: Consultar um usuário por ID
Quando eu chamar um usuário pelo seu ID
Então eu devo validar que foi retornado um usuário com sucesso

@consultar_id_inexistente
Cenario: Consultar um ID com usuário inexistente
Quando eu consultar um ID inexistente
Então eu devo receber a mensagem 'Usuário não encontrado'

@consultar_id_invalido
Cenario: Consultar um ID com usuário invalido
Quando eu consultar um ID invalido
Então eu devo receber a mensagem invalida sendo 'ID inválido'

@consultar_dados_do_usuario
Cenario: Consultar dados do usuário
Quando eu consultar os usuários através da API
Então eu devo validar que todos os resultados possuem id, nome, email e cargo

@consultar_ids_unicos
Cenario: Consultar IDs únicos
Quando eu consultar os usuários através da API
Então eu devo validar que todos os IDs são únicos
