Rails.application.routes.draw do
  resources :products
    get 'home/index'

    get '/guide' => 'home#guide'
    get '/guide/emoji' => 'home#emoji_maker'
    get '/guide/proposal' => 'home#proposal' 
    
    root 'main_pages#index'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
