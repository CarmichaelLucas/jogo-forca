class DadosJogo
  attr_accessor :palavra_sorteada, :erros, :escolhas_feitas, :acertos

  def initialize(palavra_sorteada)
    self.palavra_sorteada = palavra_sorteada
    self.erros = 0
    self.escolhas_feitas = []
    self.acertos = (1..palavra_sorteada.size).map do |_letra|
      '_'
    end
  end
end
