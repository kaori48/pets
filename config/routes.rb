Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'#localhosst3000する
  get 'home/about' => 'homes#about'
  get 'users/mypage' => 'users#mypage'
  get '/blog_genre/:id' => 'blogs#genre',as:'blog_genre'#ジャンル検索でidが必要
  resources :users
  resources :blogs do
  	resource :blog_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end