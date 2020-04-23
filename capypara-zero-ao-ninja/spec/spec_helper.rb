
require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL

  # define configuração de resolução de janela para todos os cenários
  config.before(:example) do
      page.current_window.resize_to(1280, 800)
  end

  config.after(:example) do |e|
      # obtem o nome de cada cenário, remove caracteres especiais e
      # substitui espaços por underline ( "_" )
      nome_cenario =  e.description.gsub(/[^A-Za-z0-9]/, ' ').tr(' ', '_')
      
      # gera e salva evidência com o respectivo nome do cenário
      page.save_screenshot('log/' + nome_cenario + '.png')

      # gera e salva evidência com o respectivo nome do cenário
      # em *caso de falha* (e.exception)
      # para habilitar esta funcionalidade, remova comentário da linha abaixo
      # page.save_screenshot('log/' + nome_cenario + '.png') if e.exception
  end

end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome

  # para execução em modo headless, favor habilitar a linha
  # abaixo (47) e comentar a linha 43
  # config.default_driver = :selenium_chrome_headless

  # define o tempo de espera padrão em que o Capybara aguarda
  # para o carregamento de um elemento específico
  config.default_max_wait_time = 5
  # definida URL padrão para resumo de rotas nos cenários / suites
  config.app_host = 'http://training-wheels-protocol.herokuapp.com'
end