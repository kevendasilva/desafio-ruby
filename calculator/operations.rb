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
