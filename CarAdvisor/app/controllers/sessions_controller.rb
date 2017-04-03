class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to 
      else
        message  = "Account non attivato. "
        message += "Controlla la tua e-mail."
        flash[:warning] = message
        redirect_to root_url
      end

    else
      flash.now[:danger] = 'La combinazione email/password è errata '
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
