class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

def hello
    render html: "Proviamo a iniziare CarAdvisor"
  end
include SessionsHelper
def log_in(user)
    session[:user_id] = user.id
end

end
