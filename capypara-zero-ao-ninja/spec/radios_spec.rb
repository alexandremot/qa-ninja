
describe 'radios', :radios do
    before(:each) do
        visit '/radios'
    end

    it 'seleção por ID' do
        choose('cap')
    end

    it 'seleção find e css selector' do
        test = find('input[value=iron-man]')
        test.click
    end

    after(:each) do
        sleep 2
    end
end