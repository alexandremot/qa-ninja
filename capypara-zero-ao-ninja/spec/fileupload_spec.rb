
describe 'Upload', :fileupload do

    before(:each) do
        visit 'http://training-wheels-protocol.herokuapp.com/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/test.txt'
        @image = Dir.pwd + '/spec/fixtures/test.png'
    end

    it 'upload com arquivo texto' do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'test.txt'
    end

    
    it 'upload com arquivo png', :upload_imagem do
        attach_file('file-upload', @image)
        click_button 'Upload'

        puts Capybara.default_max_wait_time
        img = find('#new-image')
        expect(img[:src]).to include 'test.png'
    end

    after(:each) do
        sleep 2
    end
end