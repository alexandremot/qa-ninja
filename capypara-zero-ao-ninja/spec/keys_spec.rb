
describe 'Keys', :keys do

    before(:each) do
        visit '/key_presses'
    end

    it 'enviando teclas' do
        # array com teclas para teste
        teclas = %i[tab escape space enter shift control alt]

        teclas.each do |tecla|
            find('#campo-id').send_keys tecla
            expect(page).to have_content 'You entered: ' + tecla.to_s.upcase
            sleep 2
        end
    end


    
    it 'enviando letras' do
        # array com strings para teste
        letras = %w[a s d f g h j k l]

        letras.each do |tecla|
            find('#campo-id').send_keys tecla
            expect(page).to have_content 'You entered: ' + tecla.to_s.upcase
            sleep 2
        end
    end

    after(:each) do
        sleep 1
    end
end
