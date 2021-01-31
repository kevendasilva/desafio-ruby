require_relative 'operations'
require 'json'

module Calculator

  class Menu

    def initialize
     
      operator = Operations.new  # Instanciando um objeto com a classe Operations

      # Menu de inicialização da calculadora.
      puts "---------------------------------------"
      puts "| Seja bem-vindo à calculadora maluca |" 
      puts "--------------------------------------- \n \n"
      puts "1 - Média preconceituosa"
      puts "2 - Calculadora sem números"
      puts "3 - Filtrar filmes"
      puts "4 - Sair \n \n"
      puts "Opção de número:"

      
      option = gets.chomp.to_i # Lendo a opção do usuário (inteiro).

      puts "\n \n"

      # Realizando a operação, de acordo com a opção escolhida pelo usuário.

      case option

      when 1 # Média preconceituosa
        puts "Digite os nomes dos alunos e suas respectivas notas:"
        # (no formato {nome_do_aluno1: nota_aluno1, ..., nome_do_alunon: nota_alunon })"      
        # Onde "nome_do_alunoi" é uma String e "nota_alunoi" é do tipo Float.
       
        input = gets.chomp # Leitura dos dados
    
        grades = JSON.parse(input) # Criando um objeto JSON

        puts "\n \n"

        puts "Digite os nomes dos alunos que estão na lista negra:"

        blacklist = gets.chomp # Aluno que estão na lista negra

        average = operator.biased_mean(grades, blacklist) # Chamando a operação "biased_mean"
       
        puts "\n \n A média da turma foi: #{average.round(2)} . \n \n" # Apresentando a saída com apenas duas casas decimais
      
      when 2 # Calculadora sem números
        puts "Digite um ou mais números:"
        numbers = gets.chomp # Número(s) utilizado(s) na verificação.

        divisible = operator.no_integers(numbers)

        puts "\n \nO resultado foi:"
        puts divisible # Resultado da verificação
        puts "\n \n"

      when 3 # Filtrar filmes
        puts "Escolha os gêneros do filmes:"
        genres = gets.chomp # Gêneros dos filmes
        puts "Ano escolhido:"
        year = gets.chomp.to_i # Ano escolhido pelo usuário

        listOfFilms = operator.filter_films(genres, year) # Lista de filmes

        # Exibindo nome dos filmes
        puts "-------------------"
        puts "| Lista de filmes |" 
        puts "------------------- \n"
        for film in listOfFilms
          puts "#{film} \n"
        end
        puts "------------------- \n \n"

      when 4 # Saindo
        puts "Você saiu da calculadora. \n \n"
        exit

      else # Opção inválida
        puts "(!) Opção inválida. (!) \n \n"
      end
    
    end

  end

end
