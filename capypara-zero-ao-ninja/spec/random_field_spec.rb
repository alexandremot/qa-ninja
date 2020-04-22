
describe 'Random field', :random_field do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/login2'
    end

    it 'Random' do
        find('#userId').set 'stark'
        find('#passId').set 'jarvis!'

        login_form = find('#login').text

        puts login_form

        case login_form
        when /Dia/
            find('#day').set '29'
        when /Mês/
            find('#month').set '05'
        when /Ano/
            find('#year').set '1970'
        end

        click_button 'Login'

        div_flash = find('#flash')
        expect(div_flash).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    after(:each) do
        sleep 2
    end
end
