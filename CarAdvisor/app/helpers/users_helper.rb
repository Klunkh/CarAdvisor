module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200"
    image_tag(gravatar_url, alt: user.nome, class: "gravatar")
  end
 def prova(user)
        cane=""
	user = User.find_by(id: user)
	if(user.tipo=="f") 
		cane="Meccanico";
	else cane="Utente";
	end
 return cane
end

		
end
