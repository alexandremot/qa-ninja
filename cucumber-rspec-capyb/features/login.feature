# language: pt
Funcionalidade: Login
  Para que eu possa gerenciar os filmes de catálogo NinjaFlix
  Sendo um usuário previamente cadastrado
  Posso acessar o sistema com o meu email e senha

  @caminho_feliz
  Cenário: Acesso
    Quando eu faço login com "tony@stark.com" e senha "123"
    Então devo ser autenticado
    E o nome "Tony Stark" deverá ser exibido na tela

  @senha_invalida
  Cenário: Senha inválida
    Quando eu faço login com "tony@stark.com" e senha "abcde"
    Então não devo ser autenticado
    E devo ver a mensagem "Usuário e/ou senha inválidos"


  Cenário: Usuário
    Quando eu faço login com "hulk@stark.com" e senha "123"
    Então não devo ser autenticado
    E devo ver a mensagem "usuário ou senha inválidos"


  Cenário: Email não informado
    Quando eu faço login com "" e "abcdef"
    Então não devo ser autenticado
    E devo ver a mensagem "Oops. Cadê o email?"


  Cenário: Senha não informada
    Quando eu faço login com "teste@gmail.com" e ""
    Então não devo ser autenticado
    E devo ver a mensagem "Oops. Cadê a senha?"
