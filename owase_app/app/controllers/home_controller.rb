class HomeController < ApplicationController
  before_action :authenticate_user, {only: [:top, :setRiyoId, :undo, :ninti, :koukou, :eiyo, :setCId, :courseSanka, :riyosyaSanka]}
  
  
  def login
    @user = User.find_by(name: params[:idkensaku], password_digest: params[:password])
    if @user
      session[:user_name] = @user.name
      flash[:notice] = "ログインしました"
      redirect_to("/home/top")
      
    else
      @error_message = "IDまたはパスワードが間違っています。"
      @idkensaku = params[:idkensaku]
      @password = params[:password]
      render("home/loginform")
    end
    
  end
  
  def logout 
    session[:user_name] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
  
  def top
    if params[:kensaku].blank? == false
      simei = params[:kensaku]
      @riyosyas = Riyosya.where("simei LIKE ?","%#{simei}%").order(riyosyaId: :asc)
    else
      if params[:selectTiku] != "全件"
        tiku = params[:selectTiku]
        @riyosyas = Riyosya.where("tiku LIKE ?","%#{tiku}%").order(riyosyaId: :asc)
      else
        @riyosyas = Riyosya.all.order(riyosyaId: :asc)
      end
    end
  end
  
  def course
    if params[:kensaku]
      name = params[:kensaku]
      @courses = Course.where("name LIKE ?","%#{name}%").order(zissiYmd: :asc)
    else
      @courses = Course.all.order(id: :asc)
    end
  end
  
  
  def setRiyoId
    session[:riyoId] = params[:riyoId]
    redirect_to("/home/undo")
  end
  
  def undo
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @undos = Undo.where(riyosyaId: session[:riyoId])
  end
  
  def ninti
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @nintis = Ninti.where(riyosyaId: session[:riyoId])
  end
  
  def koukou
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @koukous = Koukou.where(riyosyaId: session[:riyoId])
  end
  
  def eiyo
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @eiyos = Eiyo.where(riyosyaId: session[:riyoId])
  end
  
  def setCId
    session[:courseId] = params[:courseId]
    redirect_to("/home/courseSanka")
  end
  
  def courseSanka
    @course = Course.find_by(id: session[:courseId])
   # @sankas = Sanka.where(courseId: session[:courseId])
   @sankas = Sanka.joins(%| INNER JOIN Riyosyas on Sankas.riyosyaId = Riyosyas.riyosyaId |).select("sankas.*, riyosyas.simei").where(courseId: session[:courseId]).order(riyosyaId: :asc)
  end
  
  def riyosyaSanka
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @sankas = Sanka.joins(%| INNER JOIN Courses on Sankas.courseId = Courses.id |).select("sankas.*, courses.name, courses.zissiYmd").where(riyosyaId: session[:riyoId])
  end
  
  def syussekibo
    @course = Course.find_by(id: params[:courseId])
   @sankas = Sanka.joins(%| INNER JOIN Riyosyas on Sankas.riyosyaId = Riyosyas.riyosyaId |).select("sankas.*, riyosyas.riyosyaId, riyosyas.simei, riyosyas.kenko, riyosyas.biko as rbiko").where(courseId: params[:courseId]).order(riyosyaId: :asc)
  end
  
  def coursePrint
    @course = Course.find_by(id: params[:courseId])
  end
  
  def tairyokuPrint
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @undos = Undo.find_by(id: params[:undoId])
  end
  
  def pdfshow
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @undos = Undo.where(riyosyaId: session[:riyoId])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "pdffile", #pdfファイルの名前。これがないとエラーが出ます
               template: 'home/top.pdf.erb' , #テンプレートファイルの指定。viewsフォルダが読み込まれます。
               layout: 'pdfshow.html' ,
               :encoding => 'UTF-8'
      end
    end
  end
end
