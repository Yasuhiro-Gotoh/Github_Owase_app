class PostsController < ApplicationController
    before_action :authenticate_user
  
  def show
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    
  end
  
  def new
    @riyosya = Riyosya.new
  end
  
  def create 
    if params[:image]
      @riyosya = Riyosya.new(simei: params[:simei], birthYmd: params[:birthYmd], syasin: "#{@riyosya.id}.jpg", riyosyaId: params[:riyosyaId], seibetsu: params[:seibetsu], zyusyo: params[:zyusyo], tiku: params[:tiku], rireki: params[:rireki], kenko: params[:kenko], biko: params[:biko])
      if @nyukyosya.save
        session[:riyoId] = params[:riyosyaId]
        @riyosya.syasin = "#{@riyosya.id}.jpg"
        #写真を保存
        image = params[:image]
        File.binwrite("public/user_images/#{@riyosya.syasin}",image.read);
        flash[:notice] = "登録しました"
        redirect_to("/posts/show")
      else
        render("/posts/new")
      end
    else
      @riyosya = Riyosya.new(simei: params[:simei], birthYmd: params[:birthYmd], syasin: "default_image.jpg", riyosyaId: params[:riyosyaId], seibetsu: params[:seibetsu], zyusyo: params[:zyusyo], tiku: params[:tiku], rireki: params[:rireki], kenko: params[:kenko], biko: params[:biko])
      if @riyosya.save
        session[:riyoId] = params[:riyosyaId]
        flash[:notice] = "登録しました"
        redirect_to("/posts/show")
      else
        render("/posts/new")
      end
    end
  end
  
  def edit
    #更新前のテーブルの値を取得
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])

    #フォームより取得
    @riyosya.riyosyaId = params[:riyosyaId]
    @riyosya.simei = params[:simei]
    @riyosya.birthYmd = params[:birthYmd]
    @riyosya.seibetsu = params[:seibetsu]
    
    #写真がある場合のファイル名保存
    if params[:image] 
      @riyosya.syasin = "#{@riyosya.id}.jpg"
    end

    @riyosya.zyusyo = params[:zyusyo]
    @riyosya.tiku = params[:tiku]
    @riyosya.rireki = params[:rireki]
    @riyosya.kenko = params[:kenko]
    @riyosya.biko = params[:biko]
    

    
    #フォームの値で更新
    if @riyosya.save
      session[:riyoId] = params[:riyosyaId]
      #画像の更新がある場合
      if params[:image] 
        #写真のファイル名をid.jpgで保存
        @riyosya.syasin = "#{@riyosya.id}.jpg"
        #写真を保存
        image = params[:image]
        File.binwrite("public/user_images/#{@riyosya.syasin}",image.read);
      end
      flash[:notice] = "更新しました"
      redirect_to("/posts/show")
    else
      render("/posts/show")
    end
  end
  
  def delete
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    
    
    if @riyosya.destroy
      flash[:notice] = "削除しました"
      redirect_to("/home/top")
    else
      render("/posts/show")
    end
  end
  
  
  def undoNew
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @undo = Undo.new
  end
  
  def undoShow
    id = params[:id]
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @undo = Undo.find_by(id: id)
  end
  
  def undoCreate
    @undo = Undo.new(undo_params)
    if @undo.save 
      flash[:notice] = "登録しました"
      redirect_to("/posts/undoShow/#{@undo.id}")
    else
      @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
      render 'undoNew'
    end
  end
  
  def undoUpdate
    #更新前のテーブルの値を取得
    @undo = Undo.find_by(id: params[:undo][:id])

    if @undo.update(undo_params)
      flash[:notice] = "更新しました"
      redirect_to("/posts/undoShow/#{@undo.id}")
    else
      render 'undoShow'
    end
  end
  
  def undoDelete
    #削除するテーブルの値を取得
    @undo = Undo.find_by(id: params[:id])

    if @undo.destroy
      flash[:notice] = "削除しました"
      redirect_to("/home/undo")
    else
      render 'undoShow'
    end
  end
  
  
  def koukouNew
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @koukou = Koukou.new
  end
  
  def koukouShow
    id = params[:id]
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @koukou = Koukou.find_by(id: id)
  end
  
  def koukouCreate
    @koukou = Koukou.new(koukou_params)
    if @koukou.save 
      flash[:notice] = "登録しました"
      redirect_to("/posts/koukouShow/#{@koukou.id}")
    else
      @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
      render 'koukouNew'
    end
  end
  
  def koukouUpdate
    #更新前のテーブルの値を取得
    @koukou = Koukou.find_by(id: params[:koukou][:id])

    if @koukou.update(koukou_params)
      flash[:notice] = "更新しました"
      redirect_to("/posts/koukouShow/#{@koukou.id}")
    else
      render 'koukouShow'
    end
  end
  
  def koukouDelete
    #削除するテーブルの値を取得
    @koukou = Koukou.find_by(id: params[:id])

    if @koukou.destroy
      flash[:notice] = "削除しました"
      redirect_to("/home/koukou")
    else
      render 'koukouShow'
    end
  end
  


  def nintiNew
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @ninti = Ninti.new
  end

  def nintiShow
    id = params[:id]
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @ninti = Ninti.find_by(id: id)
  end
  
  def nintiCreate
    @ninti = Ninti.new(ninti_params)
    if @ninti.save 
      flash[:notice] = "登録しました"
      redirect_to("/posts/nintiShow/#{@ninti.id}")
    else
      @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
      render 'nintiNew'
    end
  end
  
  def nintiUpdate
    #更新前のテーブルの値を取得
    @ninti = Ninti.find_by(id: params[:ninti][:id])

    if @ninti.update(ninti_params)
      flash[:notice] = "更新しました"
      redirect_to("/posts/nintiShow/#{@ninti.id}")
    else
      render 'nintiShow'
    end
  end
  
  def nintiDelete
    #削除するテーブルの値を取得
    @ninti = Ninti.find_by(id: params[:id])

    if @ninti.destroy
      flash[:notice] = "削除しました"
      redirect_to("/home/ninti")
    else
      render 'nintiShow'
    end
  end
  
  
  def eiyoNew
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @eiyo = Eiyo.new
  end
  
  def eiyoShow
    id = params[:id]
    @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
    @eiyo = Eiyo.find_by(id: id)
  end
  
  def eiyoCreate
    @eiyo = Eiyo.new(eiyo_params)
    if @eiyo.save 
      flash[:notice] = "登録しました"
      redirect_to("/posts/eiyoShow/#{@eiyo.id}")
    else
      @riyosya = Riyosya.find_by(riyosyaId: session[:riyoId])
      render 'eiyoNew'
    end
  end
  
  def eiyoUpdate
    #更新前のテーブルの値を取得
    @eiyo = Eiyo.find_by(id: params[:eiyo][:id])

    if @eiyo.update(eiyo_params)
      flash[:notice] = "更新しました"
      redirect_to("/posts/eiyoShow/#{@eiyo.id}")
    else
      render 'eiyoShow'
    end
  end
  
  def eiyoDelete
    #削除するテーブルの値を取得
    @eiyo = eiyo.find_by(id: params[:id])

    if @eiyo.destroy
      flash[:notice] = "削除しました"
      redirect_to("/home/eiyo")
    else
      render 'eiyoShow'
    end
  end

  
  def courseNew
    @course = Course.new
  end
  
  def courseShow
    @course = Course.find_by(id: params[:id])
  end
  
  def courseCreate
    @course = Course.new(course_params)
    if @course.save 
      flash[:notice] = "登録しました"
      redirect_to("/posts/courseShow/#{@course.id}")
    else
      render 'courseNew'
    end
  end
  
  def courseUpdate
    #更新前のテーブルの値を取得
    @course = Course.find_by(id: params[:course][:id])

    if @course.update(course_params)
      flash[:notice] = "更新しました"
      redirect_to("/posts/courseShow/#{@course.id}")
    else
      render 'courseShow'
    end
  end
  
  def courseDelete
    #削除するテーブルの値を取得
    @course = Course.find_by(id: params[:id])

    if @course.destroy
      flash[:notice] = "削除しました"
      redirect_to("/home/course")
    else
      render 'courseShow'
    end
  end

  def sankaNew
    @sanka = Sanka.new
  end
  
  def sankaShow
    @sanka = Sanka.find_by(id: params[:id])
  end
  
  def sankaCreate
    @sanka = Sanka.new(sanka_params)
    if @sanka.save 
      flash[:notice] = "登録しました"
      redirect_to("/posts/sankaShow/#{@sanka.id}")
    else
      render 'sankaNew'
    end
  end
  
  def sankaUpdate
    #更新前のテーブルの値を取得
    @sanka = Sanka.find_by(id: params[:sanka][:id])

    if @sanka.update(sanka_params)
      flash[:notice] = "更新しました"
      redirect_to("/posts/sankaShow/#{@sanka.id}")
    else
      render 'sankaShow'
    end
  end
  
  def sankaDelete
    #削除するテーブルの値を取得
    @sanka = Sanka.find_by(id: params[:id])

    if @sanka.destroy
      flash[:notice] = "削除しました"
      redirect_to("/home/sanka")
    else
      render 'sankaShow'
    end
  end

private

  def koukou_params
    # permit許可しないと登録・更新ができないため
    params.require(:koukou).permit!
  end

  def ninti_params
    # permit許可しないと登録・更新ができないため
    params.require(:ninti).permit!
  end

  def undo_params
    # permit許可しないと登録・更新ができないため
    params.require(:undo).permit!
  end

  def eiyo_params
    # permit許可しないと登録・更新ができないため
    params.require(:eiyo).permit!
  end
  
  def course_params
    # permit許可しないと登録・更新ができないため
    params.require(:course).permit!
  end

  def sanka_params
    # permit許可しないと登録・更新ができないため
    params.require(:sanka).permit!
  end


end
