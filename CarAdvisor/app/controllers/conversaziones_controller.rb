class ConversazionesController < ApplicationController
before_action :logged_in_user, only: [:create]
skip_before_action :verify_authenticity_token

def reload
redirect_to("http://localhost:3000/conversaziones/index")
end
  def load_conversazione
   
    @conversazione=Conversazione.order(:created_at)
    @msg=@conversazione.where(user_id: params[:id1], destinatario_id: converti_mail_id(params[:id2])).or(@conversazione.where(user_id: converti_mail_id(params[:id1]), user_id: params[:id2]))
    
    respond_to do |format|
    format.html { render :layout => false }
    end
   end
  def index
     @messaggi=Scadenze.all
     @conversazione=Conversazione.all
     @conversaziones=@conversazione.select(:user_id, :destinatario_id).distinct
     @user=User.all
    
  end
  def new
     @conversazione=Conversazione.new
  end
  
  def create
     @conversazione=Conversazione.new(conversazione_params)
    respond_to do |format|
     if @conversazione.save
	flash[:success] = "Messaggio inviato correttamente"
        format.html { redirect_to (:back)}
        format.json { render :show, status: :created, location: @conversazione }
      else
        flash[:danger]= "Errore invio messaggio, ricontrolla i dati inseriti"
        format.html { render :new }
        format.json { render json: @conversazione.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def conversazione_params
    params.require(:conversaziones).permit(:user_id, :destinatario_id, :messaggio, :letto, :inviato)
  end
  
  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
  def trova_user_id (email_input)
    @user=User.all
    @user.where(email: email_input).find_each do |utente|
    return utente.id
    end
  end
  def converti_mail_id (id_user)
    @user=User.all
    @user.where(id: id_user).find_each do |utente|
    return utente.email
    end
  end
end
