#ui = interface user
def dar_boas_vindas
    puts "Bem vindo ao Foge-foge"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
end

def desenha(mapa)
    puts mapa
end

def pede_movimento
    puts "Onde deseja ir?"
    movimento = gets.strip
end