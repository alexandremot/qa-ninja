
describe 'Tabelas', :tables do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/tables'
    end
    
    
    it 'deve validar o salario' do
        # obtem a tabela por completo pelas rows
        table_rows = all('table tbody tr')
        # detecta e obtém (por completo) a linha que contem 'Robert'
        tony_stark_data = table_rows.detect { |ator| ator.text.include?('Robert') }
        
        # valida se essa linha contém o valor procurado na tabela
        expect(tony_stark_data.text).to include '10.000.000'
    end

    
    it 'deve exibir o salário do ator Vin Diesel' do
        # localiza o item que contem o texto específico
        vin_diesel_data = find('table tbody tr', text: '@vindiesel')
        # valida se o salário é o correspondente
        expect(vin_diesel_data).to have_content '10.000.000'
    end

    
    it 'deve exibir o filme Velozes e Furiosos' do
        # localiza o item que contem o texto específico
        vin_diesel_data = find('table tbody tr', text: '@vindiesel')
        # obtem o texto da coluna (td) Filme
        vin_diesel_data = vin_diesel_data.all('td ')[2].text
        # valida se o salário é o correspondente
        expect(vin_diesel_data).to eq 'Velozes e Furiosos'
    end

    it 'deve exibir o instagram do ator Chris Evans' do
        chris_evans_data = find('table tbody tr', text: 'Chris Evans')

        chris_evans_insta = chris_evans_data.all('td')[4].text

        expect(chris_evans_insta).to eql '@teamcevans'
    end


    it 'deve selecionar o ator Chris Pratt para remoção', :chris_pratt_test do
        chris_pratt_data = find('table tbody tr', text: 'Pratt')

        a_delete = chris_pratt_data.find('a[class=delete]').click

        javascript_alert_text = page.driver.browser.switch_to.alert.text
        expect(javascript_alert_text).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    
    it 'deve selecionar o ator Chris Pratt para edição', :chris_pratt_edit_test do
        chris_pratt_data = find('table tbody tr', text: 'Pratt')

        a_edit = chris_pratt_data.find('a[class=edit]').click

        javascript_alert_text = page.driver.browser.switch_to.alert.text
        expect(javascript_alert_text).to eql 'Chris Pratt foi selecionado para edição!'
    end


    after(:each) do
        sleep 2
    end
end