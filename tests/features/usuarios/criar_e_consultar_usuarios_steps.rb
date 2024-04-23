require 'pry'

Quando('eu preencher o body com nome email e cargo corretamente') do
  @resposta = Usuarios.new.consultar_todos

  body = {}
  body['nome'] = 'teste' + @resposta['response'].last['id'].to_s
  body['email'] = 'teste' + @resposta['response'].last['id'].to_s + '@email.com'
  body['cargo'] = 'Tester'

  @novo_usuario = Usuarios.new.criar_usuario(body.to_json)
end


Então('devo criar um novo usuario') do
  expect(@novo_usuario.to_i).to be > 15
  expect(@resposta['response'].last).to include("cargo" => "Tester")
  expect(@resposta['code']).to eq(201)
  expect(@resposta['response']).not_to be_nil
end

Então('o id deste usuario deve ser unico e seguir o padrão dos usuarios anteriores') do  
  binding.pry
  @id_anterior = Usuarios.new.consultar_por_id(15)
  ultimo_id_anterior = @id_anterior['response']['id'].to_i
    
  expect(@novo_usuario['response']['id']).not_to be_nil
  novo_id = @novo_usuario['response']['id'].to_i
  expect(novo_id).to be > ultimo_id_anterior
  # Verifica se o ID do novo usuário segue o padrão dos usuários anteriores
  expect(novo_id).to eq(ultimo_id_anterior + 1)
    
end

Quando('eu criar um novo usuario usando um parametro incorreto') do
  @resposta = Usuarios.new.criar_usuario('{"nome": "teste", "cargo": "Tester"}')
end

Então('devo receber o codigo {int}') do |codigo_esperado|
  codigo_esperado = 400
  expect(@resposta['code']).to eq(codigo_esperado)
end

Quando('eu preencher o body com email e cargo') do
  @resposta = Usuarios.new.criar_usuario('{"email": "teste@teste.com", "cargo": "Tester"}')
end

Então('devo receber uma mensagem de erro') do
  expect(@resposta['code']).to eq(400)
  expect(@resposta['response']).to eq('JSON inválido')
end

uando('eu preencher o body com nome e cargo') do
  @resposta = Usuarios.new.criar_usuario('{"nome": "teste", "cargo": "Tester"}')
end

Quando('eu preencher o body com nome e email') do
  @resposta = Usuarios.new.criar_usuario('{"nome": "teste", "email": "teste@teste.com"}')
end

Quando('eu preencher o body com cargo') do
  @resposta = Usuarios.new.criar_usuario('{"cargo": "Tester"}')
end

Quando('eu preencher o body com email') do
  @resposta = Usuarios.new.criar_usuario('{"email": "teste@teste.com"}')
end

Quando('eu preencher o body com nome') do
  @resposta = Usuarios.new.criar_usuario('{"nome": "teste"}')
end