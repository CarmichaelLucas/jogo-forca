require_relative 'dados_jogo'
require_relative 'jogo_da_forca'
require_relative 'temas'
require_relative 'mensagens'

module Core

    include Temas
    include JogoDaForca
    include Mensagens

    def menu opcao
        
        palavra = sortear_palavra opcao
        
        if palavra.eql? false
            return false
        end

        dados_jogo = DadosJogo.new palavra
        
        resultado = JogoDaForca::jogar dados_jogo

        while dados_jogo.erros != 5
            if resultado.eql? 1
                puts ''
                puts Mensagens::MSG[:um]
                return false
            end
    
            if resultado.eql? 3
                puts ''
                puts Mensagens::MSG[:tres]
                resultado = JogoDaForca::arriscar_letra dados_jogo
            end
    
            if resultado.eql? 4
                puts ''
                puts Mensagens::MSG[:quatro]
                resultado = JogoDaForca::arriscar_letra dados_jogo
            end
    
            if resultado.eql? 5
                dados_jogo.erros += 1
                puts ''
                puts Mensagens::MSG[:cinco]
                resultado = JogoDaForca::jogar dados_jogo
            end

            if resultado.eql? 6
                puts ''
                puts Mensagens::MSG[:seis]
                return false
            end
    
            if resultado.eql? 8
                puts ''
                puts Mensagens::MSG[:oito]
                resultado = JogoDaForca::jogar dados_jogo
            end
           
            if resultado.eql? 9
                puts ''
                puts Mensagens::MSG[:nove]
                return true
            end
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