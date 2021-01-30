require_relative 'operations'
require 'json'

module Calculator
  class Menu
    def initialize
      # Instanciando um objeto com a classe Operations

      operator = Operations.new

      # Menu de inicialização da calculadora.

      puts "---------------------------------------"
      puts "| Seja bem-vindo à calculadora maluca |" 
      puts "--------------------------------------- \n \n"
      puts "1 - Média preconceituosa"
      puts "2 - Calculadora sem números"
      puts "3 - Filtrar filmes"
      puts "4 - Sair \n \n"
      puts "Opção de número:"

      # Lendo a opção do usuário (inteiro).

      opcao = gets.chomp.to_i

      puts "\n \n"

      case opcao
      when 1
        puts "Digite os nomes dos alunos e suas respectivas notas:"
        # (no formato {nome_do_aluno1: nota_aluno1, ..., nome_do_alunon: nota_alunon })"      
        # Onde "nome_do_alunoi" é uma String e "nota_alunoi" é do tipo Float.
       
        entrada = gets.chomp # Leitura dos dados
    
        grades = JSON.parse(entrada) # Criando um objeto JSON

        puts "Digite o nome dos alunos que estão na lista negra:"

        blacklist = gets.chomp # Aluno que estão na lista negra

        operator.biased_mean(grades, blacklist) # Chamando a operação "biased_mean"
      when 2
        
      when 3
 
      when 4
        puts "Você saiu da calculadora."
      else
        puts "Opção inválida."
      end

      # Realizando a operação, de acordo com a opção escolhida pelo usuário.
      
    end
  end
end
