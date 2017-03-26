class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

def hello
    render html: "Proviamo a iniziare CarAdvisor"
  end

include SessionsHelper


end
