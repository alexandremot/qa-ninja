
describe 'Select2', :multi do

    describe('multiple') do
        before(:each) do
            visit '/apps/select2/multi.html'
        end

        def seleciona_ator(nome_do_ator)
            find('.select2-selection--multiple').click
            find('.select2-search__field').set nome_do_ator
            find('.select2-results__option').click
        end

        it 'seleciona atores' do
            lista_de_atores = ['Jim Carrey', 'Owen']
            lista_de_atores.each do |ator|
                seleciona_ator(ator)
            end
            sleep 2
        end

        it 'seleciona ator direto pelo option' do
            find("option[label='Kevin James']").click
            sleep 2
        end
    end
end