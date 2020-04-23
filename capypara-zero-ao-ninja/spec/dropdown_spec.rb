
describe 'Caixa de opções', :dropdown do

    before(:each) do
        visit '/dropdown'
    end

    it 'Item específico simples' do
        select('Loki', from: 'dropdown')
    end

    it 'item específico com o find' do
        my_dropdown = find('.avenger-list')
        my_dropdown.find('option', text: 'Steve Rogers').select_option
    end

    it 'item aleatório', :sample do
        my_dropdown = find('.avenger-list')
        my_dropdown.all('option').sample.select_option
    end

    after(:each) do
        sleep 3
    end
end