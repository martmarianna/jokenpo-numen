#Marianna Martins de Oliveira, 122.847.137-18, mariannamrtns@gmail.com
#Escolhi a linguagem Ruby porque é a que venho estudando continuamente desde que comecei a transição de carreira, há 6 meses.  
#Quando fui salvar com a extensão .rb o arquivo não foi aceito pra fazer o upload, então subi .txt , mas é .rb 

def score_game(draw_count, computer_scorecount, user_scorecount)
    #Calcula o placar do jogo
    total = draw_count + computer_scorecount + user_scorecount
    puts "
          ============= PLACAR: ============
          Você: #{user_scorecount},
          Computador: #{computer_scorecount},
          Empates: #{draw_count}.
          =================================="
end

def score_game_final(draw_count, computer_scorecount, user_scorecount)
    #Calcula as estatísticas do jogo

    if user_scorecount > computer_scorecount
        puts "\n
              =======================================
              RESULTADO FINAL: Você ganhou! UHuull! 😁"
    elsif user_scorecount < computer_scorecount
        puts "\n
              =======================================
              RESULTADO FINAL: O computador ganhou! 😒"
    else
        puts "\n
              =======================================
                  RESULTADO FINAL: Deu empate! 😐"
    end

    total = draw_count + computer_scorecount + user_scorecount
    puts "\n
          =========================================
          |ESTATÍSTICAS FINAIS: 
          |Total de Partidas: #{total} ,
          |Você: #{(user_scorecount.to_f/total*100).round(2)}% ,
          |Computador: #{(computer_scorecount.to_f/total*100).round(2)}% ,
          |Empates: #{(draw_count.to_f/total*100).round(2)}% .
          ========================================="
end

def check_result (user_choice, draw_count, computer_scorecount, user_scorecount)
    #Calcula a escolha do computador e o resultado do jokenpo
    computer_choice = rand(1..3)
    puts "
        ===================
        Você escolheu #{user_choice},
        O computador escolheu #{computer_choice}..."

        draw = "\n          ==== Nessa rodada deu empate! ===="
        computer_score = "\n          ==== O computador ganhou essa rodada! ===="
        user_score =  "\n          ==== Você ganhou essa rodada! ===="
        
    if user_choice == 1 #pedra
        if computer_choice == 1
            puts draw
            draw_count=draw_count+1
        elsif computer_choice == 2
            puts computer_score
            computer_scorecount=computer_scorecount+1
        elsif computer_choice == 3
            puts user_score
            user_scorecount=user_scorecount+1
        end 
    elsif user_choice == 2 #papel
        if computer_choice == 1
            puts computer_score
            computer_scorecount=computer_scorecount+1
        elsif computer_choice == 2
            puts draw
            draw_count=draw_count+1
        elsif computer_choice == 3
            puts user_score
            user_scorecount=user_scorecount+1
        end
    elsif user_choice == 3 #tesoura
        if computer_choice == 1
            puts computer_score
            computer_scorecount=computer_scorecount+1
        elsif computer_choice == 2
            puts user_score
            user_scorecount=user_scorecount+1
        elsif computer_choice == 3
            puts draw
            draw_count=draw_count+1
        end
    end
    score_game(draw_count, computer_scorecount, user_scorecount)

    return draw_count, computer_scorecount, user_scorecount
end 

#Aqui começa o programa
puts "Como você quer jogar? 
1- Modo Livre - você pode sair a qualquer momento, 
2 - 'Melhor de 3' contra o PC?"
game_mode = gets.to_i

draw_count=0
computer_scorecount=0
user_scorecount=0
i=0

if game_mode == 1
    puts "\nVocê escolheu o Modo Livre!"

    loop do
        puts "
        Vamos jogar!
        ===================
        1- Pedra
        2- Papel
        3- Tesoura
        ===================
        Escolha: "

        user_choice=gets.chomp.to_i

        if user_choice >3 or user_choice <1  
            puts "Opção inválida!"
        else
            draw_count, computer_scorecount, user_scorecount = check_result(user_choice, draw_count, computer_scorecount, user_scorecount)
        end 
        puts "Quer continuar jogando (s/n)?"
        new_game = gets.chomp

        while (new_game == 's' or new_game == 'n') == false
            puts "Opção inválida! Quer continuar jogando (s/n)?"
            new_game = gets.chomp
        end
        #system "clear", não deixei porque não sei qual o sistema operacional que será usado
        break if new_game == 'n'
    end
    #system "clear"
    score_game_final(draw_count, computer_scorecount, user_scorecount)
elsif game_mode == 2
    puts "\nVocê escolheu Melhor de 3!"
    until (user_scorecount > 2 and user_scorecount > computer_scorecount) or (computer_scorecount > 2 and computer_scorecount > user_scorecount)
        i+=1
        puts "
        Vamos jogar! 
        #{i}ª rodada: 
        ===================
        1- Pedra
        2- Papel
        3- Tesoura
        ===================
        Escolha: "

        user_choice=gets.chomp.to_i

        if user_choice >3 or user_choice <1  
            puts "Opção inválida!"
        else
            draw_count, computer_scorecount, user_scorecount = check_result(user_choice, draw_count, computer_scorecount, user_scorecount)
        end
        #Se, em duas rodadas, o usuário vencer ou o computador vencer, saí do loop
        if user_scorecount == 2 or computer_scorecount == 2
            puts "\nFim de jogo!"
            break 
        end
    end 
    #system "clear"
    score_game_final(draw_count, computer_scorecount, user_scorecount)
else
    puts "Opção inválida!"
end 


    