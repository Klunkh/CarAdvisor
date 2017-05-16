class PreferitisController < ApplicationController
skip_before_action :verify_authenticity_token
def new
    @preferiti=Preferiti.new
end
def destroy
	 Preferiti.find(params[:id]).destroy
    flash[:success] = "Officina cancellata dai preferiti correttamente."
    redirect_to officinas_index_url
  end
def create
   @preferiti = Preferiti.new(preferiti_params)
   respond_to do |format|
	if @preferiti.save
	flash[:success] = "Officina aggiunta ai preferiti!"
    format.html { redirect_to "http://localhost:3000/officinas/index"}
    format.json { render :show, status: :ok, location: @officina}
	else
	flash[:danger]= "Errore aggiunta officina. Ricontrolla i dati per favore"
        format.html { render :new }
        format.json { render json: @preferitis.errors, status: :unprocessable_entity }
      end
     
    end
  end
		
      
   

  private 
  def preferiti_params
      params.require(:preferitis).permit(:user_id, :meccanico)
  end
end
