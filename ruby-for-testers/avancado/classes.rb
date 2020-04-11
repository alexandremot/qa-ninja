
class Conta

    attr_accessor :saldo, :nome

    def initialize(nome)
        self.saldo = 0
        self.nome = nome
    end

    def deposita(valor)
        self.saldo += valor
        puts "Depositando a quantia de R$ #{valor} na conta de #{nome}!"
    end
end

minha_conta = Conta.new('Ale')

minha_conta.deposita(100.00)
puts minha_conta.saldo

minha_conta.deposita(10.00)
puts minha_conta.saldo