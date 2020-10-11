require_relative 'lib/core'
require_relative 'lib/palavras'

def main
    puts ''
    puts 'Bem Vindo ao Jogo da Forca !'
    puts 'Escolha o tema do jogo:'
    puts '1 - Frutas'
    puts '2 - Comidas'
    puts '3 - Cidades'
    puts '0 - Sair'
    print '>: '
    opcao = gets.chomp.to_i
end

def vamos_jogar? forca
    if Core::menu_do_jogo forca
        puts 'Jogar novamente? [s/n]:'
        print '>: '
        escolha = gets.chomp.to_i
        
        if escolha.eql? 's'
            main
        else
            return false
        end
    end

    false
end

# MAIN
include Palavras
include Core

opcao = true
while opcao

    case main

    when 1
        palavra_sorteada = Palavras::sortear 'fruta'
        forca = { 
            palavra_sorteada: palavra_sorteada, 
            erros: 0
        }

        unless vamos_jogar? forca
            break
        end
        
        break
    when 2
        palavra_sorteada = Palavras::sortear 'comida'
        forca = { 
            palavra_sorteada: palavra_sorteada, 
            erros: 0
        }

        unless vamos_jogar? forca
            break
        end
        
        break
    when 3
        palavra_sorteada = Palavras::sortear 'cidade'
        forca = { 
            palavra_sorteada: palavra_sorteada, 
            erros: 0
        }

        unless vamos_jogar? forca
            break
        end

        break
    when 0
        opcao = false
        break
    else
        puts 'Opção Invalida !'
    end
end