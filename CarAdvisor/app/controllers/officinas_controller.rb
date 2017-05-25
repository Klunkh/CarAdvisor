class OfficinasController < ApplicationController
skip_before_action :verify_authenticity_token
before_action :meccanico_user,     only: [:new, :destroy] 
  def show
	@officina=Officina.find(params[:id])
	@rating=Rating.where(user_id: current_id)
        @ratings=Rating.all
	@ratings.where(user_id: current_id, officina_id: @officina).find_each do |officina|
	voto=officina.voto
    end
  end
    def setta_cortesia
    @officina=Officina.find(params[:id])
        if @officina.cortesia?
            @officina.update(:cortesia => 'f')
        else 
        @officina.update(:cortesia => 't')
        end
        redirect_to(:back)
    end
  def destroy
	 Officina.find(params[:id]).destroy
    flash[:success] = "Officina cancellata correttamente."
    redirect_to officinas_index_url
  end

  def edit
	@officina=Officina.find(params[:id])
  end
   def new 
   @officina=Officina.new
   @user=User.all
  end

  def index
	@officina=Officina.all
    @preferiti=Preferiti.all
  end
   
def update
  @officina = Officina.find(params[:id])
    respond_to do |format|
      
      if @officina.update(officina_params)
	flash[:success] = "Dati aggiornati correttamente."
        format.html { redirect_to "http://localhost:3000/officinas/index"}
        format.json { render :show, status: :ok, location: @officina}
      else
	flash[:danger] = "Errore nella modifica dei dati."
        format.html { render :edit }
        format.json { render json: @officina.errors, status: :unprocessable_entity }
      
      end
end
    end
  def create 
    @officina = Officina.new(officina_params)
    respond_to do |format|
     if @officina.save
	flash[:success] = "Officina aggiunta correttamente"
        #redirect_to root_url
        format.html { redirect_to root_url}
        format.json { render :show, status: :created, location: @officina }
      else
	flash[:danger]= "Errore aggiunta officina. Ricontrolla i dati per favore"
        format.html { render :new }
        format.json { render json: @officina.errors, status: :unprocessable_entity }
      end
     
    end
  end
  
  private 
  def officina_params
      params.require(:officinas).permit(:user_id, :indirizzo, :contatto, :numero_telefono)
  end
 def meccanico_user
      redirect_to(root_url) unless current_user.tipo?
      flash[:info]="Solo i meccanici possono inserire nuove officine"
    end
end
