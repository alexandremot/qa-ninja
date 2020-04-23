describe 'Alerts', :alerts do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/javascript_alerts'
    end

    it 'Alerts' do
        click_button 'Alerta'
        mensagem = page.driver.browser.switch_to.alert.text
        expect(mensagem).to eql 'Isto é uma mensagem de alerta'
    end

    it 'Confirma OK', :confirma_ok do
        click_button 'Confirma'
        mensagem = page.driver.browser.switch_to.alert.text
        expect(mensagem).to eql 'E ai confirma?'

        # clica no botão OK
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end


    it 'Confirma Cancelar', :confirma_cancelar do

        click_button 'Confirma'

        mensagem = page.driver.browser.switch_to.alert.text
        expect(mensagem).to eql 'E ai confirma?'

        # clica no botão Cancelar
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'Accept Prompt', :accept_prompt do
        accept_prompt(with: 'Alexandre') do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, Alexandre'
    end

    # it 'Dismiss Prompt', :dismiss_prompt do
    #    accept_prompt(with: '') do
    #        click_button 'Cancelar'
    #    end

    #    expect(page).to have_content 'Olá, null'
    #end

    after(:each) do
        sleep 2
    end

end
