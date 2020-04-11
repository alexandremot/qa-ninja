
require_relative '../../app/bank'

describe ContaCorrente do

    describe 'Saque' do
        context 'Quando o valor é positivo' do
            before(:all) do
                @conta_corrente = ContaCorrente.new(1000.00)
                @conta_corrente.saca(200)
            end
            
            it 'Então atualiza saldo' do
                expect(@conta_corrente.saldo).to eql 795.00
            end
        end


        context 'Quando o saldo for zero' do
            before(:all) do
                @conta_corrente = ContaCorrente.new(0.00)
                @conta_corrente.saca(100.00)
            end

            it 'Então exibe mensagem' do
                expect(@conta_corrente.mensagem).to eql 'Saldo insuficiente para saque'
                expect(@conta_corrente.saldo).to eql 0.00
            end
        end


        context 'Quando o saldo for insuficiente' do
            before(:all) do
                @conta_corrente = ContaCorrente.new(100.00)
                @conta_corrente.saca(101.00)
            end

            it 'Então exibe mensagem' do
                expect(@conta_corrente.mensagem).to eql 'Saldo insuficiente para saque'                
            end

            it 'E o saldo permance' do
                expect(@conta_corrente.saldo).to eql 100.00
            end
        end


        context 'Quando supera o limite do saque' do
            before(:all) do
                @conta_corrente = ContaCorrente.new(1000.00)
                @conta_corrente.saca(701.00)
            end

            it 'Então exibe mensagem' do
                expect(@conta_corrente.mensagem).to eql 'Limite máximo por saque é de R$ 700.0'
            end

            it 'E o saldo permance' do
                expect(@conta_corrente.saldo).to eql 1000.00
            end
        end
    end
end