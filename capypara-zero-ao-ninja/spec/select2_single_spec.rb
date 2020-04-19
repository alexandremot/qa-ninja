
describe 'Select2', :single do

    describe('single') do
        before(:each) do
            visit 'http://training-wheels-protocol.herokuapp.com/apps/select2/single.html'
        end

        it 'seleciona ator por nome' do
            find('.select2-selection--single').click
            sleep 2
            ator_selecionado = find('.select2-results__option', text: 'Sandler')
            ator_selecionado.click
            sleep 2
        end

        it 'seleciona por campo de busca e clique' do
            find('.select2-selection--single').click
            sleep 1
            find('.select2-search__field').set 'Chris'
            find('.select2-results__option').click
            sleep 2
        end
    end
end