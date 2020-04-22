
# ***************************************************************************
# disclaimer: o Capybara só funciona bem com iFrames quando estes possuem id
# como alternativa, neste código um id é injetado no iFrame para que a
# validação possa se concretizar
# ***************************************************************************

describe 'iframes' do

    describe 'bom', :nice_iframe do

        before(:each) do
            visit 'http://training-wheels-protocol.herokuapp.com/nice_iframe'
        end

        it 'adicionar ao carrinho' do
            within_frame('burgerId') do
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                produto.find('a').click

                cart = find('#cart')
                expect(cart).to have_content 'R$ 4,50'
                sleep 2
            end
        end
    end


    describe 'iFrame ruim', :ugly_iframe do

        before(:each) do
            visit 'http://training-wheels-protocol.herokuapp.com/bad_iframe'
        end

        it 'carrinho deve estar vazio' do

            # script jQuery para injetar um id temporário dentro do iFrame
            script = '$(".box-iframe").attr("id", "tempId");'
            page.execute_script(script)

            within_frame('tempId') do
                carrinho = find('#cart')
                expect(carrinho).to have_content 'Seu carrinho está vazio!'
                sleep 2
            end
        end
    end
end