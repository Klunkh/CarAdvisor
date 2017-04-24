class OperazionisController < ApplicationController
skip_before_action :verify_authenticity_token
   def new 
   @operazioni=Operazioni.new
   @user=User.all
  end
  def show
     @operazioni=Operazioni.find(params[:id])
  end
  def edit
	@operazioni=Operazioni.find(params[:id])
  end

  def create 
    @operazioni = Operazioni.new(operazioni_params)
    respond_to do |format|
     if @operazioni.save
	flash.now[:success] = "Operazione aggiunta correttamente"
        #redirect_to root_url
        format.html { redirect_to root_url}
        format.json { render :show, status: :created, location: @operazioni }
      else
	flash.now[:danger]= "Errore aggiunta operazioni. Ricontrolla i dati per favore"
        format.html { render :new }
        format.json { render json: @operazioni.errors, status: :unprocessable_entity }
      end
end
end
  def destroy
    Operazioni.find(params[:id]).destroy
    flash[:success] = "Operazione cancellata correttamente."
    redirect_to root_url
  end

  def update
   @operazioni=Operazioni.find(params[:id])
    respond_to do |format|
      
	
      if @operazioni.update(operazioni_params)
	flash.now[:success] = "Dati aggiornati correttamente."
        format.html { redirect_to root_url}
        format.json { render :show, status: :ok, location: @operazioni }
      else
	flash.now[:danger] = "Errore nella modifica dei dati personali."
        format.html { render :edit }
        format.json { render json: @operazioni.errors, status: :unprocessable_entity }
      
      end
    end
  end

  def index
  end
   private 
  def operazioni_params
      params.require(:operazionis).permit(:user_id, :km, :oggetto, :meccanico, :data, :targa, :costo)
  end
end

