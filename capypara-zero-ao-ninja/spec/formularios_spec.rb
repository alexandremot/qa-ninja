
describe 'formularios' do

    it 'login com sucesso' do
        visit "http://training-wheels-protocol.herokuapp.com/login"

        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'

        div_message = find('#flash')
        expect(div_message.visible?).to be true

        expect(div_message).to have_content "Olá, Tony Stark. Você acessou a área logada!"
    end
end