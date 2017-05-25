module ConversazionesHelper
$array_conversazioni=[]
def converti_mail_id (id_user)
    @user=User.all
    @user.where(id: id_user).find_each do |utente|
    print (utente.email)
    return utente.email
    end
  end
def test(input)
    print(input)
    end
def trova_user_id (email_input)
    @user=User.all
    @user.where(email: email_input).find_each do |utente|
    return utente.id
    end
  end  

def aggiungi_controlla_id(id)
   print($array_conversazioni )
   if($array_conversazioni.include?(id))
      return false
   else
      $array_conversazioni.push(id)
      return true
    end 
    end
def azzera_array
    $array_conversazioni=[]
    print("ARRAY AZZERATO \n")
    end
end
