module Forca
    
    def arriscar_letra letra, palavra_sorteada
        if palavra_sorteada.include? letra
            return true
        end

        false
    end

    def arriscar_palavra palavra, palavra_sorteada
        if palavra_sorteada.eql? palavra
            return true
        end

        false
    end

    

end