class PaginaStaticaController < ApplicationController
  def home
    require 'date'
    @autoveicolo=Autoveicolo.all
    @scadenze=Scadenze.all
    @data_passata=get_data_passata()
  end
  def contattaci
  end
  def show 
  end
 private 
  def get_data_passata()
	oggi=Time.now.strftime("%Y/%m/%d")
  	oggi=Date.parse(oggi)
    data_passata=oggi.mjd+30
    return data_passata
end
end
