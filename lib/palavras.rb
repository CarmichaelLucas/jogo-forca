module Palavras

    def sortear tipo_jogo

        lista_palavras = []
        File.open(File.expand_path("../../file/#{tipo_jogo}.txt", __FILE__), 'r') do |file|

            while linha = file.gets
                lista_palavras << linha.strip.downcase
            end

        rescue => exception
            
            puts "ERRO: #{exception.message}"
            
        end

        lista_palavras.sample

    end
    
end