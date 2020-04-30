
Quando("eu faço login") do
    visit "/"
    sleep 3
  end
  
  Então("devo ser autenticado") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então("o nome {string} deverá ser exibido na tela") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  