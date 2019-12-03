class HomeController < ApplicationController

  def top
    if params[:kensaku].blank? == false
      simei = params[:kensaku]
      @kumijyuns = Kumijyun.where("setai LIKE ?","%#{simei}%").order(bango: :asc)
    elsif params[:selectKumihan] != "全件"
      kumihan = params[:selectKumihan]
      @kumijyuns = Kumijyun.where("han LIKE ?","%#{kumihan}%").order(bango: :asc)
      
    elsif params[:selectSentaku] != "全件"
      sentaku = params[:selectSentaku]
      @kumijyuns = Kumijyun.where(check: sentaku).order(bango: :asc)
    else
      @kumijyuns = Kumijyun.all.order(bango: :asc)
    
    end
    
  end
  
  def setBangoId
    session[:bangoId] = params[:bangoId]
    redirect_to("/posts/index")
  end
end
