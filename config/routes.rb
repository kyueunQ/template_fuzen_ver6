Rails.application.routes.draw do
  resources :galleries
  resources :products
    get 'home/index'

    get '/guide' => 'home#guide'
    get '/guide/emoji_maker' => 'home#emoji_maker'
    get '/guide/proposal' => 'home#proposal'
    get '/guide/img_upload' => 'home#img_upload'
    
    root 'main_pages#index'
    
  post '/galleries/state' => 'galleries#state_update'
  post '/create_board' => 'galleries#create_board'
  
  get '/galleries/:id/delete' => 'galleries#destroy_img'
  get '/galleries/:id/download' => 'galleries#download_img', as: "download_img"
  
  
  # user id
  get '/mypage/:id' => 'mypages#show'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
