require_relative 'dados_jogo'
require_relative 'jogo_da_forca'
require_relative 'temas'
require_relative 'mensagens'

module Core
  include Temas
  include JogoDaForca
  include Mensagens

  def menu(opcao)
    palavra = sortear_palavra opcao

    return false if palavra.eql? false

    dados_jogo = DadosJogo.new palavra

    resultado = JogoDaForca.jogar dados_jogo

    while dados_jogo.erros != 5
      if resultado.eql? 1
        puts ''
        puts Mensagens::MSG[:um]
        return false
      end

      if resultado.eql? 3
        puts ''
        puts Mensagens::MSG[:tres]
        resultado = JogoDaForca.arriscar_letra dados_jogo
      end

      if resultado.eql? 4
        puts ''
        puts Mensagens::MSG[:quatro]
        resultado = JogoDaForca.arriscar_letra dados_jogo
      end

      if resultado.eql? 5
        dados_jogo.erros += 1
        puts ''
        puts Mensagens::MSG[:cinco]
        resultado = JogoDaForca.jogar dados_jogo
      end

      if resultado.eql? 6
        puts ''
        puts Mensagens::MSG[:seis]
        return false
      end

      if resultado.eql? 8
        puts ''
        puts Mensagens::MSG[:oito]
        resultado = JogoDaForca.jogar dados_jogo
      end

      next unless resultado.eql? 9

      puts ''
      puts Mensagens::MSG[:nove]
      return true
    end
  end

  def sortear_palavra(opcao)
    case opcao
    when 1
      Temas.sortear 'fruta'

    when 2
      Temas.sortear 'comida'

    when 3
      Temas.sortear 'cidade'

    when 0
      puts ''
      puts 'Saindo ...'
      false
    else
      puts ''
      puts 'Opção Invalida !'
      false
    end
  end

  def vamos_jogar?(resultado_jogo)
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
    gets.chomp.to_s.downcase
  end
end
