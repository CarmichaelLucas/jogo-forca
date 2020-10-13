module Temas

    def sortear palavra_sobre

        lista_palavras = []
        File.open(File.expand_path("../../file/#{palavra_sobre}.txt", __FILE__), 'r') do |file|

            while linha = file.gets
                lista_palavras << linha.strip.downcase
            end

        rescue => exception
            
            puts "ERRO: #{exception.message}"
            
        end

        lista_palavras.sample

    end
    
end