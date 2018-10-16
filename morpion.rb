def new_board #je définis chacune de mes cases, comme elles sont à l'origine.
  @a1 = " "
  @a2 = " "
  @a3 = " "
  @b1 = " "
  @b2 = " "
  @b3 = " "
  @c1 = " "
  @c2 = " "
  @c3 = " "
end

def squares #j'en fait un array
  [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3]
  
end

def win_combos #les différentes combinaisons gagnantes
  [[@a1, @a2, @a3],
  [@a1, @b2, @c3],
  [@a1, @b1, @c1],
  [@b1, @b2, @b3],
  [@c1, @c2, @c3],
  [@c1, @b2, @a3],
  [@a2, @b2, @c2],
  [@a3, @b3, @c3]]
  
end


def print_grid #J'ai "déssiné" une grille de morpion
  puts
  puts "   1   2   3"
  puts "A  #{@a1} | #{@a2} | #{@a3} " 
  puts "  ---|---|---"
  puts "B  #{@b1} | #{@b2} | #{@b3} "
  puts "  ---|---|---"
  puts "C  #{@c1} | #{@c2} | #{@c3} "
  puts
  check_for_winner
  
end

def tour_joueur1 
  user_choice_hash = {"a1" => @a1, #le joueur écrit a1 (marche aussi pour A1) et je le transforme en donnée pour mon array
                      "a2" => @a2,
                      "a3" => @a3,
                      "b1" => @b1,
                      "b2" => @b2,
                      "b3" => @b3,
                      "c1" => @c1,
                      "c2" => @c2,
                      "c3" => @c3}
                    

  puts "#{@joueur_1}, choisis une case"
  user_choice = gets.chomp.downcase
  user_choice_hash.each do |choice, square|
    if user_choice == choice 
      
        square.sub!(" ", "X")#substitue l'espace par le caractère X
        print_grid
      
    elsif user_choice == "q" or user_choice == "quit" #permet de quitter la partie à tout moment
      exit
    end
  end
  check_for_winner
end

def tour_joueur2
  user_choice_hash = {"a1" => @a1,
                      "a2" => @a2,
                      "a3" => @a3,
                      "b1" => @b1,
                      "b2" => @b2,
                      "b3" => @b3,
                      "c1" => @c1,
                      "c2" => @c2,
                      "c3" => @c3}
                    

  puts "#{@joueur_2}, choisis une case:"
  user_choice = gets.chomp.downcase
  user_choice_hash.each do |choice, square|
    if user_choice == choice 
      
        square.sub!(" ", "O") #substitue l'espace par le caractère O
        print_grid
      
    elsif user_choice == "q" or user_choice == "quit"
      exit
    end
  end
  check_for_winner
end

def check_for_winner 
  win_combos.each do |combos| 
    if combos[0] == "O" && combos[1] == "O" && combos[2] == "O"
      puts "#{@joueur_2} a gagné! Félicitations!"
      exit 
    elsif combos[0] == "X" && combos[1] == "X" && combos[2] == "X"
      puts "#{@joueur_1} a gagné! Félicitations!"
      exit #il faudrait mettre "choix" mais là j'ai plus le temps... :)
      #choix
    #else
      #puts "Égalité! q pour quitter"
    end
  end
end

def start_game
  puts "Bienvenue au jeu du morpion"
  puts "Pour jouer, note les coordonées de la case désirée (exemple : a1, b3)."
  puts "Pour quitter, appuie sur q + enter"
  puts "Nom du Joueur 1 :"
    @joueur_1 = gets.chomp
    puts "Nom du Joueur 2 :"
    @joueur_2 = gets.chomp
end

#def choix
#  puts "On refait une partie? Y/N"
#  reponse = gets.chomp
#  if reponse == Y
#    start_game
#  elsif reponse == N
#    exit
#    end
#  end

      

def run_game
  start_game
  new_board
  while true
    print_grid
    tour_joueur1
    tour_joueur2
  end
end

run_game