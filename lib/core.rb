require_relative 'dados_jogo'
require_relative 'jogo_da_forca'
require_relative 'temas'

module Core

    include Temas
    include JogoDaForca

    def menu opcao
        
        palavra = sortear_palavra opcao
        
        if palavra.eql? false
            return false
        end

        dados_jogo = DadosJogo.new palavra
        
        resultado_jogo = JogoDaForca::jogar dados_jogo

        resultado = vamos_jogar? resultado_jogo
        
        if resultado.eql? 's'
            opcao = main
            menu opcao
        elsif resultado.eql? 'n'
            return false
        end

    end

    def sortear_palavra opcao
        case opcao
        when 1
            palavra = Temas::sortear 'fruta'
            return palavra
        when 2
            palavra = Temas::sortear 'comida'
            return palavra
        when 3
            palavra = Temas::sortear 'cidade'
            return palavra
        when 0
            puts ''
            puts 'Saindo ...'
            return false
        else
            puts ''
            puts 'Opção Invalida !'
            return false
        end
    end

    def vamos_jogar? resultado_jogo
        
        if resultado_jogo
            puts ''
            puts 'Parabéns, Venceu :)'
        else
            puts ''
            puts 'Você Perdeu :('
        end
        
        puts ''
        puts 'Deseja jogar novamente ? [s/n]'
        print '>: '
        opc = gets.chomp.to_s.downcase
        opc
    end
    
end