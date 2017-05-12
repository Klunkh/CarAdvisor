class OperazionisController < ApplicationController
skip_before_action :verify_authenticity_token
before_action :logged_in_user,

  def new 
   @operazioni=Operazioni.new
   @user=User.all
   @autoveicolo= Autoveicolo.all
  end
  
  
  def show
     @operazioni=Operazioni.find(params[:id])
     rescue ActiveRecord::RecordNotFound  
     redirect_to root_url
     flash[:info]="L'operazione selezionata non esiste."
     return
  end
  
  
  def edit
	@operazioni=Operazioni.find(params[:id])
    rescue ActiveRecord::RecordNotFound  
    redirect_to root_url
    flash[:info]="L'operazione selezionata non esiste."
    return
  end

  def create 
      @operazioni = Operazioni.new(operazioni_params)
        respond_to do |format|
          if @operazioni.save
	
	      condizione=@autoveicolo.where(user_id: @operazioni.user_id, id: @operazioni.targa)
	      
	     if condizione.select(:kilometri).to_sql.to_f < (@operazioni.km).to_f
		condizione=@autoveicolo.where(user_id: @operazioni.user_id, id: @operazioni.targa)
	      	condizione.update(:kilometri => (@operazioni.km).to_f)
		condizione.update(:media => calcolo_media_km(@operazioni.targa))
	     end
	      flash[:success] = "Operazione aggiunta correttamente"
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
        flash[:success] = "Dati aggiornati correttamente."
        format.html { redirect_to operazionis_url + '/' + (@operazioni.id).to_s}
        format.json { render :show, status: :ok, location: @operazioni }
      else
        flash[:danger] = "Errore nella modifica dei dati personali."
        format.html { render :edit }
        format.json { render json: @operazioni.errors, status: :unprocessable_entity }
      
      end
    end
  end

  def index
  end
  
private 
  def calcolo_media_km(id_veicolo)
	@autoveicolo=Autoveicolo.all
	@operazione=Operazioni.all
	@operazione=@operazione.order(:data)
	indice=0
	condizione=@operazione.where(targa: id_veicolo)
	giorni=[]
	km=[]
	media=[]
	somma=0
	
	condizione.find_each do |operazione|	
		b=operazione.data.mjd
		giorni.push(b)
		c=operazione.km
		km.push(c)
	end
    
	for i in 0 ... giorni.count
		if(indice==0)
			data_inizio=giorni[0].to_f
			km_inizio=km[0].to_f
			indice+=1
		else
			data_mom=giorni[i].to_f	
			if(data_mom == data_inizio)
				km_mom=km[i].to_f
			else
				km_mom=km[i].to_f
				media_km=km_mom-km_inizio
				km_inizio=km_mom
				media_giorni=data_mom-data_inizio
				data_inizio=data_mom
				media.push(media_km/media_giorni)
				indice+=1
			end
			
	end
	end

	for j in media
		somma=somma+j.to_f	
		
	end
	mediaTot=somma/indice
	print(mediaTot)
	return mediaTot
	
					
	
  end
		
  def operazioni_params
      params.require(:operazionis).permit(:user_id, :km, :oggetto, :meccanico, :data, :targa, :costo)
  end
  def update_kilometri
	params.require(:operazionis).permit(:targa)
  end
  
  def logged_in_user
      unless logged_in?
        flash[:danger] = "Effettua il log-in e riprova."
        redirect_to login_url
      end
    end
end

