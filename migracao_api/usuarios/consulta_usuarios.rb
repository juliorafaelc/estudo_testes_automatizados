require 'json'
require 'pry'

class Usuarios
  attr_accessor :usuarios

  def initialize
    json_content = File.read('../migracao_api/usuarios/BD.json')
    # json_content = File.read('BD.json')
    @usuarios = {}
    @usuarios['code'] = 200
    @usuarios['response'] = JSON.parse(json_content)
  end

  def criar_usuario(json_body)
    begin
      JSON.parse(json_body)
    rescue JSON::ParserError => e
      @usuarios['code'] = 400
      @usuarios['response'] = 'JSON inválido'
      return @usuarios
    end

    hash_body = JSON.parse(json_body)
    id = criar_proximo_id(@usuarios['response'])

    @usuarios['response'] << { 'id' => id, 'nome' => hash_body['nome'], 'email' => hash_body['email'], 'cargo' => hash_body['cargo'] }

    File.write('../migracao_api/usuarios/BD.json', JSON.pretty_generate(@usuarios['response']))
    # File.write('./BD.json', JSON.pretty_generate(@usuarios['response']))
    @usuarios['code'] = 201
    @usuarios['response'] = "#{id}"
  end

  def criar_proximo_id(response)
    return response.last['id'] + 1
  end

  def consultar_todos
    @usuarios
  end

  def consultar_por_id(id)
    @busca = {}

    #validação do id
    if id.nil?
      @busca['code'] = 400
      @busca['response'] = 'ID não informado'
      return @busca
    elsif id.to_i == 0
      @busca['code'] = 400
      @busca['response'] = 'ID inválido'
      return @busca
    end

    #busca do usuário
    retorno = @usuarios['response'].select do |usuario|
      usuario['id'] == id
    end

    unless retorno[0].nil?
      @busca['code'] = 200
      @busca['response'] = retorno
    else
      @busca['code'] = 404
      @busca['response'] = 'Usuário não encontrado'
    end

    @busca
  end
end

# Como usar:
# teste = Usuarios.new.consultar_todos
# teste = Usuarios.new.consultar_por_id(1)

# body = {}
# body['nome'] = 'teste'
# body['email'] = 'teste@email.com'
# body['cargo'] = 'Tester'

# teste = Usuarios.new.criar_usuario(body.to_json)