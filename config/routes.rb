Rails.application.routes.draw do
	devise_for :users
	root to: 'staticpages#home'
  get 'clubs/index', to: 'clubs#index', as: 'club'
end
