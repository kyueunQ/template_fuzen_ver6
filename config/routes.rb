Rails.application.routes.draw do
  resources :products
    get 'home/index'

    get '/guide' => 'home#guide'
    get '/guide/emoji_maker' => 'home#emoji_maker'
    get '/guide/proposal' => 'home#proposal'
    get '/guide/img_upload' => 'home#img_upload'
    
    root 'main_pages#index'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
