
require_relative '../../app/bank'

describe ContaPoupanca do

    describe 'Saque' do
        context 'Quando o valor é positivo' do
            before(:all) do
                @conta_poupanca = ContaPoupanca.new(1000.00)
                @conta_poupanca.saca(200)
            end
            
            it 'Então atualiza saldo' do
                expect(@conta_poupanca.saldo).to eql 798.00
            end
        end


        context 'Quando o saldo for zero' do
            before(:all) do
                @conta_poupanca = ContaPoupanca.new(0.00)
                @conta_poupanca.saca(100.00)
            end

            it 'Então exibe mensagem' do
                expect(@conta_poupanca.mensagem).to eql 'Saldo insuficiente para saque'
                expect(@conta_poupanca.saldo).to eql 0.00
            end

        end


        context 'Quando o saldo for insuficiente' do
            before(:all) do
                @conta_poupanca = ContaPoupanca.new(100.00)
                @conta_poupanca.saca(101.00)
            end

            it 'Então exibe mensagem' do
                expect(@conta_poupanca.mensagem).to eql 'Saldo insuficiente para saque'                
            end

            it 'E o saldo permance' do
                expect(@conta_poupanca.saldo).to eql 100.00
            end
        end


        context 'Quando supera o limite do saque' do
            before(:all) do
                @conta_poupanca = ContaPoupanca.new(1000.00)
                @conta_poupanca.saca(501.00)
            end

            it 'Então exibe mensagem' do
                expect(@conta_poupanca.mensagem).to eql 'Limite máximo por saque é de R$ 500.0'
            end

            it 'E o saldo permance' do
                expect(@conta_poupanca.saldo).to eql 1000.00
            end
        end
    end
end