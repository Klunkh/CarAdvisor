module AutoveicolosHelper

def find_nome_meccanico(input)
        @meccanico=User.all
        @meccanico.where(id: input).find_each do |meccanico|
        ret=meccanico.nome
        ret2=meccanico.cognome
        
        return ret+' '+ret2
        end
  end
def targa
 ret=Autoveicolo.find(params[:targa])
end

end
