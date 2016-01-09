Rails.application.routes.draw do

  get 'about/company_overview'

  get 'about/company_overview'

  get 'users' => 'users#index'
  get 'users/show'
  devise_for :user, controllers: { 
  sessions: "users/sessions", 
  registrations: "users/registrations", 
  passwords: "users/passwords",
  omniauth_callbacks: "users/omniauth_callbacks" 
  }
  resources :user, only: [:index, :show]
  root to: "top#index" 
  resources :blogs
  get 'contacts' => 'contacts#index'              # 入力画面
  post 'contacts' => 'contacts#index'              # 入力画面
  post 'contacts/confirm' => 'contacts#confirm'   # 確認画面
  post 'contacts/thanks' => 'contacts#thanks'     # 送信完了画面
  
  get 'about' => 'about#company_overview'
  
end
