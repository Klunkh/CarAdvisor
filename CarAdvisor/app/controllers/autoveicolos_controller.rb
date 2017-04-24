class AutoveicolosController < ApplicationController
before_action :logged_in_user, only: [:create]
before_action :utente_autoveicolo, only: [:destroy,:show, :update]



skip_before_action :verify_authenticity_token  


  def destroy
   Autoveicolo.find(params[:id]).destroy
    flash.now[:success] = "Autoveicolo cancellato correttamente."
    redirect_to autoveicolos_url

    
  end

  def show
    @autoveicolo=Autoveicolo.find(params[:id])
    @operazione=Operazioni.all
  end

  def index
    @autoveicolo = Autoveicolo.all
  end

  def new
    @autoveicolo = Autoveicolo.new
  end
  
  def edit
    @autoveicolo = Autoveicolo.find(params[:id])

  end
  def update
  #@autoveicolo = Autoveicolo.find(params[:id])
    respond_to do |format|
      
      if @autoveicolo.update(auto_params)
	flash[:success] = "Dati aggiornati correttamente."
        format.html { redirect_to @autoveicolo}
        format.json { render :show, status: :ok, location: @autoveicolo }
      else
	flash[:danger] = "Errore nella modifica dei dati."
        format.html { render :edit }
        format.json { render json: @autoveicolo.errors, status: :unprocessable_entity }
      
      end
end
    end
  def create 
    @autoveicolo = Autoveicolo.new(auto_params)
    respond_to do |format|
     if @autoveicolo.save
	flash[:success] = "Autoveicolo aggiunto correttamente"
        #redirect_to root_url
        format.html { redirect_to root_url}
        format.json { render :show, status: :created, location: @autoveicolo }
      else
	flash[:danger]= "Errore aggiunta autoveicolo. Ricontrolla i dati per favore"
        format.html { render :new }
        format.json { render json: @autoveicolo.errors, status: :unprocessable_entity }
      end
    
    end
  end
  
private
   def find_user
      ret = User.find(params[:id])
      return ret
   end   
   def find_nome_meccanico(input)
        @meccanico=User.where(id: input)
        ret=@meccanico.nome
        return ret
  end
  def auto_params
      params.require(:autoveicolos).permit(:targa, :modello, :carburante, :kilometri, :user_id)
  end
  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  def utente_autoveicolo
      @autoveicolo=Autoveicolo.find(params[:id])
      redirect_to(root_path) unless @autoveicolo.user_id==current_id
  end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end

