
describe 'Drag and drop', :drag_and_drop do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/drag_and_drop'
    end

    it 'test' do
        # localiza as respectivas divs do time stark e time cap
        team_stark = find('.team-stark .column')
        team_cap = find('.team-cap .column')
        # localiza a imagem do homem aranha para selecionar (click)
        spiderman = find('img[alt$="Aranha"]')
        
        # drag para o time stark
        spiderman.drag_to team_stark
        
        # valida se a imagem foi posicionada no time stark
        expect(team_stark).to have_css 'img[alt$="Aranha"]'
        # valida se não contém a imagem no time cap
        expect(team_cap).not_to have_css 'img[alt$="Aranha"]'
    end

    after(:each) do
        sleep 2
    end
end