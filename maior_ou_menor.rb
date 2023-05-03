def dar_boas_vindas
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip #strip faz com que não seja pego espaços em branco ou \n
    puts " \nComeçaremos o jogo para você, #{nome} "
    nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
    puts "Escolha: "    
    dificuldade = gets.to_i

end

def sortear_numero_secreto(dificuldade)
    case dificuldade 
    when 1
        maximo = 30
    when 2
       maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    when 5
        maximo 500
    end
    puts "\nEscolhendo um número secreto entre 1 e #{maximo}... \n"
    numero_sorteado = rand(maximo) 
    puts "Escolhido... Você tem 3 tentativas para advinhar nosso número secreto!"
    return numero_sorteado
end

def pedir_numero(chutes, tentativas, limite_de_tentativas)
    puts "\n###################################"
    puts "Tentativa #{tentativas.to_s} de #{limite_de_tentativas.to_s}"
    puts "Chutes até o momento: #{chutes.to_s}" 
    puts "###################################"
    puts "\nEntre com o número:"
    chute = gets
    puts "será que acertou? Você chutou #{chute} \n"
    chute.to_i
end

def verificar_acerto(numero_secreto, chute)
    acertou = numero_secreto == chute.to_i
    
    if  acertou
        puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
        return true
    end
    puts "Você errou!"
    if numero_secreto > chute
        puts "O número secreto é maior!"
    else
        puts "O número secreto é menor!"
    end
    false
    
end

def joga(nome, dificuldade)
    numero_secreto = sortear_numero_secreto dificuldade

    pontos_ate_agora = 1000
    limite_de_tentativas = 5
    chutes = []
    
    for tentativas in 1..limite_de_tentativas
        chute = pedir_numero chutes,tentativas, limite_de_tentativas
        chutes << chute

        if nome == "Thainara"
            puts "Acertou!"
            break
        end
        
        pontos_a_perder = (chute-numero_secreto).abs / 2.0
        pontos_ate_agora -= pontos_a_perder
    
        if verificar_acerto(numero_secreto, chute)
            break
        end
    end

    if tentativas == 5
        puts "\nO numero secreto era: #{numero_secreto}"
    end
    
    puts "você ganhou #{pontos_ate_agora} pontos."
end


nome = dar_boas_vindas
dificuldade = pede_dificuldade

def quer_jogar
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    quero_jogar.upcase == "S"
end

loop do  #whille
    joga nome, dificuldade
    if !quer_jogar
        break
    end
end