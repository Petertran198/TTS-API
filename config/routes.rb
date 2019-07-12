Rails.application.routes.draw do

  scope module: 'api' do 
      namespace :v1 do  #namespace provides custom prefix that's added  before ur routes name  
                        #Ex /v1/tasks  
                        #Ex /v1/users 
        resources :tasks
        resources :users

        post 'user_token' => 'user_token#create' #provided by knock so u can get the token for api authentication 
      end
  end
  
end
