require_relative 'lib/core'

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

# MAIN
include Core

opcao = main
Core::menu opcao