class ScadenzesController < ApplicationController
skip_before_action :verify_authenticity_token  
before_action :logged_in_user,
  def new
    @scadenze=Scadenze.new
  end

  def show
  end

  def index
  @scadenza=Scadenze.all
  @autoveicolo=Autoveicolo.all
  end

  def edit
  end

  def create
    
    @scadenze = Scadenze.new(scadenze_params)
	
    respond_to do |format|
      
      if @scadenze.save
	flash[:info] = "Scadenza aggiunta correttamente."
        format.html { redirect_to root_url}
        format.json { render :show, status: :created, location: @scadenze }
      else
	flash[:danger]= "Errore creazione scadenza"
        format.html { render :new }
        format.json { render json: @scadenze.errors, status: :unprocessable_entity }
      end
    
    end
  end

private

 def scadenze_params
   params.require(:scadenzes).permit(:user_id, :tipo, :dataStipulazione, :km, :tipoScadenza, :targa)
 end 

 def logged_in_user
     unless logged_in?
        flash[:danger] = "Effettua il log-in e riprova."
        redirect_to login_url
     end
  end
end
