require_relative 'operations'

module Calculator
  class Menu
    def initialize

      # Menu de inicialização da calculadora

      puts "---------------------------------------"
      puts "| Seja bem-vindo à calculadora maluca |" 
      puts "--------------------------------------- \n \n"
      puts "1 - Média preconceituosa"
      puts "2 - Calculadora sem números"
      puts "3 - Filtrar filmes"
      puts "4 - Sair \n \n"
      puts "Opção de número:"

      # Lendo a opção do usuário (inteiro)

      @opcao = gets.chomp.to_i

    end
  end
end
