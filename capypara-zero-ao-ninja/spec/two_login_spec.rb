
describe 'Two login', :two_login do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/access'
    end

    it 'Teste pelo find "Form" pai seguido pelo campo Login' do

        login_form = find('#login')

        login_form.find('input[name=username]').set 'stark'
        login_form.find('input[name=password]').set 'jarvis!'

        click_button 'Entrar'

        # localiza a div onde esta a mensagem de boas vindas
        div_flash = find('#flash')
        # valida o texto dentro da div acima
        expect(div_flash).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'Teste pelo find "Within"', :login_within do
        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'

            click_button 'Entrar'
        end

        # localiza a div onde esta a mensagem de boas vindas
        div_flash = find('#flash')
        # valida o texto dentro da div acima
        expect(div_flash).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'Teste de Signup pelo find "Within"', :signup_within do
        within('#signup') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'

            click_link 'Criar Conta'
        end

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end

    after(:each) do
        sleep 2
    end
end
