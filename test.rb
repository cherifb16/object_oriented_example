# Définir une méthode pour saisir les points d'évaluation et les commentaires
def input_evaluation
  puts "Veuillez indiquer sur une échelle de 1 à 5"
  point = gets.to_i
  while true
    if point <= 0 || point > 5
      puts "Veuillez indiquer sur une échelle de 1 à 5"
      point = gets.to_i
    else
      puts "Entrez vos commentaires."
      comment = gets
      post = "point：#{point}　commentaires：#{comment}"
      File.open("data.txt", "a") do |file|
        file.puts(post)
      end
      break
    end
  end
end

# Définir une méthode pour vérifier les résultats jusqu'à présent
def show_result
  puts "Résultats à ce jour."
  File.open("data.txt", "r") do |file|
    file.each_line do |line|
      puts line
    end
  end
end

while true
  puts "Sélectionnez le processus que vous souhaitez mettre en œuvre"
  puts "1 : Entrez les points d'appréciation et les commentaires."
  puts "2:Vérifiez les résultats jusqu'à présent."
  puts "3:quitter"
  num = gets.to_i

# En isolant le processus dans une méthode, la déclaration de cas n'appelle que la méthode.
  case num
  when  1
    input_evaluation
  when  2
    show_result
  when  3
    puts "Fin"
    break
  else
    puts "Veuillez entrer 1 à 3"
  end
end