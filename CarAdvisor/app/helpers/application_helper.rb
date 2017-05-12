module ApplicationHelper

def find_user
      ret = User.find(params[:id])
      return ret
   end 
def lista_notifiche
      @notifica=Notifica.all
      @notifica.where(user_id: current_id).find_each do |notifica| 
                ret=notifica.tipo
                return ret
      end 
end
def set_lettura(notifica_id)
    Notifica.update(notifica_id, :read => 't')
end
end
