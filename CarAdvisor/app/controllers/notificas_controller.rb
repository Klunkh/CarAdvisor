class NotificasController < ApplicationController

def test
   @notifica=Notifica.find(params[:id])
   respond_to do |format|
	@notifica.update(:read => 't')
	
		
      
   end
end

def date_difference(id_assicurazione)
    @assicurazione.find(params[:id_assicurazione])
    dataAss=@assicurazione.data
    dataAss=dataAss.todate
    dataOggi=DateTime.now
    dataOggi.strftime "%d/%m/%Y %H:%M"
    
end 

end
