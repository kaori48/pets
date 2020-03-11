Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'#localhosst3000する
  get 'home/about' => 'homes#about'
  get 'users/mypage' => 'users#mypage'
  get 'users/animal/:id' => 'users#animal', as: 'user_animal'
  get '/blog_genre/:id' => 'blogs#genre',as:'blog_genre'#ジャンル検索でidが必要

  resources :users do
    get 'follows' => 'relationships#follows', as: 'follows'#フォロー一覧
    get 'followers' => 'relationships#followers', as: 'followers'#フォロワー一覧
    resource :relationships, only: [:create, :destroy]
    resource :animal_permits, only: [:create, :destroy] do
      patch :status_change#ステータスを変更、animal_permit.rbで指示
    end
  end

  resources :blogs do
  	resource :blog_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :animals do
    resource :animal_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end