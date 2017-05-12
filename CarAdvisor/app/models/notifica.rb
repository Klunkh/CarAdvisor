class Notifica < ApplicationRecord

def create_notifica(id_macchina)
     Notifica.create(user_id: current.id,
                        notified_by_id: id_macchina ,
                        tipo: 'test',
                        )
end

def set_lettura(notifica_id)
    Notifica.update(notifica_id, :read => 't')
end
end
