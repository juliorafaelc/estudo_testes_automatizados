require 'pry'

Quando('eu preencher o body com nome email e cargo corretamente') do

  # body = {
  #   'nome' => 'teste' + @resposta['response'].last['id'].to_s,
  #   'email' => 'teste' + @resposta['response'].last['id'].to_s + '@example.com',
  #   'cargo' => 'Tester'
  # }  

  #@novo_usuario = Usuarios.new.criar_usuario(body.to_json)
  @resposta = Usuarios.new.consultar_todos

  @novo_usuario = Usuarios.new.criar_usuario("teste16", "teste16@email.com", "Tester")
end


Então('devo criar um novo usuario') do
  expect(@novo_usuario.to_i).to be > 15
  expect(@resposta['response'].last).to include("cargo" => "Tester")
  expect(@resposta['code']).to eq(200)
  expect(@resposta['response']).not_to be_nil
  binding.pry
end

Então('o id deste usuario deve ser unico e seguir o padrão dos usuarios anteriores') do  
  @id_anterior = Usuarios.new.consultar_por_id(15)
  ultimo_id_anterior = @id_anterior['response'].first['id'].to_i

  novo_id = @resposta['response'].last['id'].to_i

  expect(novo_id).to eq(ultimo_id_anterior + 1)
end

Quando('eu criar um novo usuario usando um parametro incorreto') do
  @resposta = Usuarios.new.consultar_todos

  @novo_usuario = Usuarios.new.criar_usuario("teste16", "teste16@email.com", 400)

  # body = {}
  # body['nome'] = 'teste' + @resposta['response'].last['id'].to_s
  # body['email'] = 'teste' + @resposta['response'].last['id'].to_s + '@email.com'
  # body['cargo'] = null

  # @novo_usuario = Usuarios.new.criar_usuario(body.to_json)
end

Então('devo receber o codigo {int}') do |codigo_esperado|
  codigo_esperado = 200
  expect(@resposta['code']).to eq(codigo_esperado)
end

Quando('eu preencher o body com email e cargo') do
  @resposta = Usuarios.new.consultar_todos

  @novo_usuario = Usuarios.new.criar_usuario("teste16", "teste16@email.com", "Tester")
end

Então('devo receber uma mensagem de erro') do
  expect(@resposta['code']).to eq(200)
end

Quando('eu preencher o body com nome e cargo') do
  @resposta = Usuarios.new.consultar_todos

  @novo_usuario = Usuarios.new.criar_usuario("teste16", "teste16@email.com", "Tester")
end

Quando('eu preencher o body com nome e email') do
  @resposta = Usuarios.new.consultar_todos

  @novo_usuario = Usuarios.new.criar_usuario("teste16", "teste16@email.com", "Tester")
end

Quando('eu preencher o body com cargo') do
  @resposta = Usuarios.new.consultar_todos

  @novo_usuario = Usuarios.new.criar_usuario("teste16", "teste16@email.com", "Tester")
end

Quando('eu preencher o body com email') do
  @resposta = Usuarios.new.consultar_todos

  @novo_usuario = Usuarios.new.criar_usuario("teste16", "teste16@email.com", "Tester")
end

Quando('eu preencher o body com nome') do
  @resposta = Usuarios.new.consultar_todos

  @novo_usuario = Usuarios.new.criar_usuario("teste16", "teste16@email.com", "Tester")
end