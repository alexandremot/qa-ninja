
describe 'Mouse hover', :mouse_hovers do

    before(:each) do
        visit '/hovers'
    end

    it 'quando passo o mouse sobre a imagem do Blade' do
        card = find('img[alt*="Bla"]')
        card.hover

        expect(page).to have_content 'Nome: Blade'
    end

    it 'quando passo o mouse sobre a imagem do Pantera Negra' do
        card = find('img[alt^="Pant"]')
        card.hover

        expect(page).to have_content 'Nome: Pantera Negra'
    end


    it 'quando passo o mouse sobre a imagem do Homem Aranha' do
        card = find('img[alt$="Aranha"]')
        card.hover

        expect(page).to have_content 'Nome: Homem Aranha'
    end

    after(:each) do
        sleep 2
    end
end
