module JogoDaForca
    
    
    def jogar dados

        puts "Erros até Aqui: #{dados.erros}"
        puts ''

        if dados.erros.eql? 5
            return false
        end

        puts ''
        puts 'Informe como quer jogar?'
        puts '1 - Arriscar letra'
        puts '2 - Arriscar palavra'
        puts '0 - Sair do Jogo'
        opcao = gets.chomp.to_i

        if opcao.eql? 0
            return false
        end

        if opcao.eql? 1
            
            unless arriscar_letra dados
                dados.erros += 1
                puts ''
                puts 'Você errou :('
                jogar dados
            end



        elsif opcao.eql? 2

        end


    end
    
    def informar_escolha
        puts ''
        puts 'Informe escolha:'
        print '>: '
        opcao = gets.chomp.to_s
        opcao
    end

    def arriscar_letra dados

        letra = informar_escolha

        if letra.size != 1
            puts ''
            puts 'Você não informou uma letra :('
            puts 'Informe corretamente.'
            arriscar_letra dados
        end

        if dados.escolhas_feitas.include? letra
            puts ''
            puts 'Você já fez essa jogada :('
            puts 'Tente novamente'
            arriscar_letra dados
        end

        if dados.acertos.join('').eql? dados.palavra_sorteada
            return true
        end

        dados.escolhas_feitas << letra

        if dados.palavra_sorteada.include? letra
            puts ''
            puts 'Ok. Acertou a Letra :)'
            indice = dados.palavra_sorteada.index letra
            dados.acertos[indice] = letra
            exibe_forca dados.acertos
            jogar dados
        end

    end

    def arriscar_palavra dados

        palavra = informar_escolha

        if dados.palavra_sorteada.eql? palavra
            return true
        end

    end

    def exibe_forca palavra
        puts ''
        palavra.map do |letra|
            print "#{letra} "
        end
        puts ''
        true
    end

end