
Quando("eu faço login com {string} e senha {string}") do |email, password|
  visit '/'
  find('#emailId').set email
  find('#passId').set password
  click_button 'Entrar'
  sleep 2
end


  Então("devo ser autenticado") do
    my_script = "return window.localStorage.getItem('default_auth_token');"
    token = page.execute_script(my_script)
    expect(token.length).to be 147
  end

  Então("o nome {string} deverá ser exibido na tela") do |expected_name|
    user_name = find('.sidebar-wrapper .user .info span')
    expect(user_name.text).to eql expected_name
  end


  Então("não devo ser autenticado") do
    my_script = "return window.localStorage.getItem('default_auth_token');"
    token = page.execute_script(my_script)
    expect(token).to be nil
  end

  Então("devo ver a mensagem {string}") do |expected_message|
    alert_div = find('.alert')
    expect(alert_div.text).to eql expected_message
  end
