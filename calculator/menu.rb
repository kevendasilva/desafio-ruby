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

      option = gets.chomp.to_i

      puts "\n \n"

      case option
      when 1
        puts "Digite os nomes dos alunos e suas respectivas notas:"
        # (no formato {nome_do_aluno1: nota_aluno1, ..., nome_do_alunon: nota_alunon })"      
        # Onde "nome_do_alunoi" é uma String e "nota_alunoi" é do tipo Float.
       
        input = gets.chomp # Leitura dos dados
    
        grades = JSON.parse(input) # Criando um objeto JSON

        puts "Digite os nomes dos alunos que estão na lista negra:"

        blacklist = gets.chomp # Aluno que estão na lista negra

        average = operator.biased_mean(grades, blacklist) # Chamando a operação "biased_mean"
       
        puts "A média da turma foi: #{average.round(2)}." # Apresentando a saída com apenas duas casas decimais
      when 2
        puts "Digite um ou mais números:"
        numbers = gets.chomp # Número(s) utilizado(s) na verificação.

        divisible = operator.no_integers(numbers)

        puts divisible # Resultado da verificação
      when 3
        puts "Escolha os gêneros do filmes:"
        genres = gets.chomp # Gêneros dos filmes
        puts "Ano escolhido:"
        year = gets.chomp.to_i # Ano escolhido pelo usuário

        listOfFilms = operator.filter_films(genres, year) # Lista de filmes
      when 4
        puts "Você saiu da calculadora."
        exit
      else
        puts "Opção inválida."
      end

      # Realizando a operação, de acordo com a opção escolhida pelo usuário.
      
    end
  end
end
