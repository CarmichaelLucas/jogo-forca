module JogoDaForca
  def jogar(dados)
    if dados.erros.eql? 5
      erro = 6
      return erro
    end

    if dados.acertos.join('').eql? dados.palavra_sorteada
      acerto = 9
      return acerto
    end

    puts ''
    puts 'Informe como quer jogar?'
    puts '1 - Arriscar letra'
    puts '2 - Arriscar palavra'
    puts '0 - Sair do Jogo'
    opcao = gets.chomp.to_i

    if opcao.eql? 0
      erro = 1
      return erro
    end

    return arriscar_letra dados if opcao.eql? 1
  end

  def informar_escolha
    puts ''
    puts 'Informe escolha:'
    print '>: '
    gets.chomp.to_s
  end

  def arriscar_letra(dados)
    letra = informar_escolha

    if letra.size != 1
      erro = 3
      return erro
    end

    if dados.escolhas_feitas.include? letra
      erro = 4
      return erro
    end

    dados.escolhas_feitas << letra

    if dados.palavra_sorteada.include? letra
      acerto = 8

      (0...dados.palavra_sorteada.size).each do |indice|
        dados.acertos[indice] = letra if dados.palavra_sorteada[indice].eql? letra
      end

      exibe_forca dados.acertos
      acerto

    else

      5

    end
  end

  def arriscar_palavra(dados)
    palavra = informar_escolha

    return true if dados.palavra_sorteada.eql? palavra
  end

  def exibe_forca(palavra)
    puts ''
    palavra.map do |letra|
      print "#{letra} "
    end
    puts ''
    true
  end
end
