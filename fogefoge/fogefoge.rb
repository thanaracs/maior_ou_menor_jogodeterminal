require_relative 'ui'

def ler_mapa(numero)
    texto = File.read "mapa#{numero}.txt"
    mapa =  texto.split "\n"
end

def encontra_jogador(mapa)
    caracter_do_heroi = "H"
    mapa.each_with_index do |linha_atual, linha|
        coluna_do_heroi = linha_atual.index caracter_do_heroi
        if coluna_do_heroi
            return [linha, coluna_do_heroi]
        end
    end
    #não achei o heroi
end

def calcula_nova_posicao(heroi, direcao)
 case direcao
            when "W"
                heroi[0] -= 1
            when "S"
                heroi[0] += 1
            when "A"
                heroi[1] -= 1
            when "D"
                heroi[1] += 1       
        end
end

def joga(nome)
    mapa = ler_mapa 1

    while true
        desenha mapa
        direcao = pede_movimento
        heroi = encontra_jogador mapa
        mapa[heroi[0]][heroi[1]] = " "
        posicao_antiga = mapa[heroi[0]][heroi[1]] = " " 
        nova_posicao = calcula_nova_posicao heroi, direcao

        if mapa[heroi[0]][heroi[1]] == "X"
            
            next
        end
        mapa[heroi[0]][heroi[1]] = "H"
    end
end

def inicia_fogefoge
    nome = dar_boas_vindas
    joga nome
end