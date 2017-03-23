class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

def hello
    render html: "Proviamo a cominciare il nostro progetto: CarAdvisor"
  end
end