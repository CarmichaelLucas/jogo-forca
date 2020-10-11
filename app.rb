require_relative 'lib/core'
require_relative 'lib/palavras'

def main
    puts 'Bem Vindo ao Jogo da Forca !'
    puts 'Escolha o tema do jogo:'
    puts '1 - Frutas'
    puts '2 - Comidas'
    puts '3 - Cidades'
    puts '0 - Sair'
    opcao = gets.chomp.to_i
    opcao
end

# MAIN
include Palavras
include Core

opcao = true
erros = 0

while opcao

    case main

    when 1
        palavra_sorteada = Palavras::sortear 'fruta'
        puts palavra_sorteada
        Core::menu_do_jogo palavra_sorteada, erros
        break
    when 2
        palavra_sorteada = Palavras::sortear 'comida'
        puts palavra_sorteada
        Core::menu_do_jogo palavra_sorteada, erros
        break
    when 3
        palavra_sorteada = Palavras::sortear 'cidade'
        puts palavra_sorteada
        Core::menu_do_jogo palavra_sorteada, erros
        break
    when 0
        opcao = false
        break
    else
        puts 'Opção Invalida !'
    end
end