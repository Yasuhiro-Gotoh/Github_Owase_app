Rails.application.routes.draw do
  #利用者情報
  get 'posts/show'
  get 'posts/show/:id' => "posts#show"
  get 'posts/new' => "posts#new"
  post 'posts/create'
  delete 'posts/delete/:id'=> "posts#delete"
  patch 'posts/edit' => 'posts#update'

  #　運動プログラム用
  get 'posts/undoShow' => "posts#undoShow"
  get 'posts/undoShow/:id' => "posts#undoShow"
  get 'posts/undoNew' => "posts#undoNew"
  post 'posts/undoCreate'
  delete 'posts/undoDelete/:id'=> "posts#undoDelete"
  patch 'posts/undoEdit' => 'posts#undoUpdate'

  #　栄養指導プログラム用
  get 'posts/eiyoShow' => "posts#eiyoShow"
  get 'posts/eiyoShow/:id' => "posts#eiyoShow"
  get 'posts/eiyoNew' => "posts#eiyoNew"
  post 'posts/eiyoCreate'
  delete 'posts/eiyoDelete/:id'=> "posts#eiyoDelete"
  patch 'posts/eiyoEdit' => 'posts#eiyoUpdate'

  #　口腔機能向上プログラム用
  get 'posts/koukouShow' => "posts#koukouShow"
  get 'posts/koukouShow/:id' => "posts#koukouShow"
  get 'posts/koukouNew' => "posts#koukouNew"
  post 'posts/koukouCreate'
  delete 'posts/koukouDelete/:id'=> "posts#koukouDelete"
  patch 'posts/koukouEdit' => 'posts#koukouUpdate'
  
  #　認知症プログラム用
  get 'posts/nintiShow' => "posts#nintiShow"
  get 'posts/nintiShow/:id' => "posts#nintiShow"
  get 'posts/nintiNew' => "posts#nintiNew"
  post 'posts/nintiCreate'
  delete 'posts/nintiDelete/:id'=> "posts#nintiDelete"
  patch 'posts/nintiEdit' => 'posts#nintiUpdate'
  

  #　コース用
  get 'posts/courseShow' => "posts#courseShow"
  get 'posts/courseShow/:id' => "posts#courseShow"
  get 'posts/courseNew' => "posts#courseNew"
  post 'posts/courseCreate'
  delete 'posts/courseDelete/:id'=> "posts#courseDelete"
  patch 'posts/courseEdit' => 'posts#courseUpdate'
  
  #　参加者用
  get 'posts/sankaShow' => "posts#sankaShow"
  get 'posts/sankaShow/:id' => "posts#sankaShow"
  get 'posts/sankaNew' => "posts#sankaNew"
  post 'posts/sankaCreate'
  delete 'posts/sankaDelete/:id'=> "posts#sankaDelete"
  patch 'posts/sankaEdit' => 'posts#sankaUpdate'


  get 'posts/new'
  get 'posts/show' => "posts#show"
  
  post 'posts/create'
  post 'posts/:id/edit' => "posts#edit"
  delete 'posts/:id/delete' => "posts#delete"

  get '/' => "home#loginform"
  post "login" => "home#login"
  post "logout" => "home#logout"
  get 'home/top'
  # 検索時用TOP
  post 'home/top' 
  
  get 'home/course'
  post 'home/course'
  
  get 'home/undo'
  get 'home/ninti'
  get 'home/koukou'
  get 'home/eiyo'

  get 'home/courseSanka'
  get 'home/riyosyaSanka'
  
  get 'home/syussekibo/:courseId' => "home#syussekibo"
  get 'home/coursePrint/:courseId' => "home#coursePrint"
  get 'home/tairyokuPrint/:undoId' => "home#tairyokuPrint"
  
  get 'home/pdfshow', to: 'home#pdfshow'
  
  #一番下に設定
  get 'home/setCourseId/:courseId' => "home#setCId"
  get 'home/:riyoId' => "home#setRiyoId"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
