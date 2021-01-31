require_relative '../extra_operations'
require 'net/http'
require 'json'

module Calculator
  class Operations
    include ExtraOperations
  
    def biased_mean(grades, blacklist)
      # "sum" corresponde a sum das notas dos alunos que não estão na lista negra
      # nStudents número de alunos que não estão na lista negra
      sum = 0
      nStudents = 0
      # Divindo a String e transformando em um Array
      blacklist = blacklist.split
      # Removendo os alunos que estão na lista negra
      for name in blacklist
        grades.delete(name)
      end
      # Recebendo as notas dos alunos
      grades.each do |name, score|
        sum += score
      end
      nStudents = grades.size # Número de alunos
      return (sum.to_f / nStudents) # Retornando o resultado, ou seja, a média.
    end
  
    def no_integers(numbers)
      def verification(number) # Método que verifica se o número (String) é divisivel por 25
        if number.length == 1 # Caso o número seja de apenas um digito
          if number == "0"
            return "S"
          else
            return "N"
          end
        else # Caso o número possua mais de um digito ou, possua um digito e tenha sinal negativo
          lastTwoDigits = number[number.length - 2] + number[number.length - 1]
          if (lastTwoDigits == "00" or lastTwoDigits == "25" or 
              lastTwoDigits == "50" or lastTwoDigits == "75") 
            return "S"
          else
            return "N"
          end
        end
      end
      
      divisible = "" # Variavel utilizada para armazenar a resposta

      numbersArray = numbers.split

      for number in numbersArray # Percorrendo o Array de Strings
        if number != numbersArray.last
          divisible += verification(number) + " " # O método "verification"
        else                                      # Verifica se o número é divisivel por 25
          divisible += verification(number)
        end
      end

      return divisible # Retornando o resultado
    end
  
    def filter_films(genres, year)
      films = get_films
  
    end
    
    private
  
    def get_films
      url = 'https://raw.githubusercontent.com/yegor-sytnyk/movies-list/master/db.json'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      return JSON.parse(response, symbolize_names: true)
    end
  end
end
