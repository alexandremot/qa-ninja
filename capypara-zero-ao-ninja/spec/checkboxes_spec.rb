
describe 'Caixas de seleção', :checkboxes do
    before(:each) do
        visit '/checkboxes'
    end

    it 'marcando uma opção' do
        check('thor')
    end

    it 'desmarcando uma opção' do
        uncheck('antman')
    end

    it 'desmarcando com find set false' do
        guardians_box = find('input[value=guardians]')
        guardians_box.set(false)
    end

    it 'marcando com find set true' do
        blackpanther_box = find('input[value=black-panther]')
        blackpanther_box.set(true)
    end
       
    after(:each) do
        sleep 1
    end
end
