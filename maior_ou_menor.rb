def dar_boas_vindas
    puts "Bem-vindo ao jogo da adivinhação"
    puts "Qual é o seu nome?"
    nome = gets
    puts " \n\nComeçaremos o jogo para você, " + nome
end

def sortear_numero_secreto
    puts "Escolhendo um número secreto entre 0 e 200... \n"
    numero_sorteado = 175
    puts "Escolhido... Você tem 3 tentativas para advinhar nosso número secreto!"
    return numero_sorteado
end

def pedir_numero(chutes, tentativas, limite_de_tentativas)
    puts "\n \n \nTentativa " + tentativas.to_s + " de " + limite_de_tentativas.to_s
    puts "Chutes até o momento: " + chutes.to_s
    puts "Entre com o número:"
    chute = gets
    puts "será que acertou? Você chutou " + chute + "\n"
    chute.to_i
end

def verificar_acerto(numero_secreto, chute)
    acertou = numero_secreto == chute.to_i
    
    if  acertou
        puts "Você acertou!\n"
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

dar_boas_vindas
numero_secreto = sortear_numero_secreto

limite_de_tentativas = 5
chutes = []
total_de_chutes = 0

for tentativas in 1..limite_de_tentativas
    chute = pedir_numero chutes,tentativas, limite_de_tentativas
    chutes[total_de_chutes] = chute
    total_de_chutes += 1

    if verificar_acerto(numero_secreto, chute)
        break
    end
end

