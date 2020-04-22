
describe 'IDs dinamicos', :ids_dinamicos do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/access'
    end

    it 'cadastro' do
        # $= : termina com
        find('input[id$=UsernameInput]').set 'Ale'
        # ^= : inicia com
        find('input[id^=PasswordInput]').set 'True'
        # *= : contém
        find('a[id*=GetStartedButton]').click

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end

    after(:each) do
        sleep 2
    end
end
