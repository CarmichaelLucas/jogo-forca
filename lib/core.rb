require_relative 'forca'

module Core

    include Forca

    def exibe palavra_sorteada, letra

        puts ''
        for indice_letras in (1..palavra_sorteada.size)
            if palavra_sorteada[indice_letras-1].eql? letra
                print " #{letra}"
            else
                print ' _'
            end
        end
        puts ''

    end

    def contador forca

        forca[:erros] += 1
        puts ''
        puts 'Você errou :(, Tente Novamente !'
        puts "Quantidade de Erros: #{forca[:erros]}"
        puts ''
        menu_do_jogo forca

    end

    def jogar forca

        puts ''
        puts 'Informe sua opção: '
        print '>: '
        jogada = gets.chomp.to_s

        case forca[:opcao]
        when 1
            unless Forca::arriscar_letra jogada, forca[:palavra_sorteada]
                contador forca
            end 

            exibe forca[:palavra_sorteada], jogada

            return true
        when 2
            unless Forca::arriscar_palavra jogada, forca[:palavra_sorteada]
                contador forca
            end

            return true
        end
    end

    def menu_do_jogo forca

        if forca[:erros] >= 0 and forca[:erros] < 5
            puts ''
            puts 'Escolha como você deseja jogar!'
            puts '1 - Arriscar Letra?'
            puts '2 - Arriscar Palavra?'
            puts '0 - Voltar Menu'
            print '>: '
            forca[:opcao] = gets.chomp.to_i

            if forca[:opcao].eql? 0 || forca[:opcao] > 2 
                main
            end

            if forca[:opcao].eql? 1
                
                if jogar forca
                    puts ''
                    puts 'Você ainda não acertou a palavra !'
                    puts "Erros até agora: #{forca[:erros]}"
                    puts ''
                    menu_do_jogo forca
                end

            end
            
            if forca[:opcao].eql? 2
                
                if jogar forca
                    puts ''
                    puts 'Você Venceu !'
                    puts ''
                    return true
                end

            end
        end
        
        if forca[:erros].eql? 5
            puts ''
            puts 'Você Perdeu !'
            puts ''
            forca[:erros] = 0
            return false
        end

    end
    
end