
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

end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  # define o tempo de espera padrão em que o Capybara aguarda
  # para o carregamento de um elemento específico
  config.default_max_wait_time = 5
  # definida URL padrão para resumo de rotas nos cenários / suites
  config.app_host = 'http://training-wheels-protocol.herokuapp.com'
end