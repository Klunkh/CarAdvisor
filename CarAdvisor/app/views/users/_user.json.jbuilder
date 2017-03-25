json.extract! user, :id, :nome, :cognome, :email, :password, :tipo, :created_at, :updated_at
json.url user_url(user, format: :json)
