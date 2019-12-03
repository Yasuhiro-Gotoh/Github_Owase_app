class PostsController < ApplicationController
  
  def index
    @kumijyun = Kumijyun.find_by(id: session[:bangoId])
  end
  
  def update
    
  end
  def update
    #更新前のテーブルの値を取得
    @kumijyun = Kumijyun.find_by(id: params[:kumijyun][:id])

    if @kumijyun.update(kumijyun_params)
      flash[:notice] = "更新しました"
      redirect_to("/posts/index")
    else
      render 'index'
    end
  end
  
  private

  def kumijyun_params
    # permit許可しないと登録・更新ができないため
    params.require(:kumijyun).permit!
  end
end
