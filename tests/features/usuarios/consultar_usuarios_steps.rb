Quando('eu consultar os usuários através da API') do
  @resposta = Usuarios.new.consultar_todos
end

Então('eu devo validar que todos os usuários foram retornados') do
  expect(@resposta['code']).to eql(200)
  expect(@resposta['response'].length).to eql(15)
end

Quando('eu chamar um usuário pelo seu ID') do
  @id = rand(1..15)
  @resposta = Usuarios.new.consultar_por_id(@id)
end

Então('eu devo validar que foi retornado um usuário com sucesso') do
  expect(@resposta['code']).to eql(200)
  expect(@resposta['response'].length).to eql(1)
  expect(@resposta['response'][0].length).to eql(4)
  expect(@resposta['response'][0]['id']).to eql(@id)
end

Quando('eu consultar um ID inexistente') do
  @resposta = Usuarios.new.consultar_por_id(200)
end

Então('eu devo receber a mensagem {string}') do |mensagem|
  expect(@resposta['code']).to eql(404)
  expect(@resposta['response']).to eql(mensagem)
end

Quando('eu consultar um ID invalido') do
  @resposta = Usuarios.new.consultar_por_id(0)
end

Então('eu devo receber a mensagem invalida sendo {string}') do |mensagem|
  expect(@resposta['code']).to eql(400)
  expect(@resposta['response']).to eql(mensagem)
end

Então('eu devo validar que todos os resultados possuem id, nome, email e cargo') do
  expect(@resposta['response'].all? { |usuario| usuario.key?('id') }).to be_truthy
  expect(@resposta['response'].all? { |usuario| usuario.key?('nome') }).to be_truthy
  expect(@resposta['response'].all? { |usuario| usuario.key?('email') }).to be_truthy
  expect(@resposta['response'].all? { |usuario| usuario.key?('cargo') }).to be_truthy

end

Então('eu devo validar que todos os IDs são únicos') do
  tamanho = []
  @resposta['response'].each do |usuario|
    tamanho << usuario['id']
  end
  expect(tamanho.length).to eql(tamanho.uniq.length)
end