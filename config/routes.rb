ActionController::Routing::Routes.draw do |map|
  map.resources :photo_galleries

  map.namespace :admin do |admin|
     admin.resources :photo_galleries
     admin.resources :multi_uploader
  end
end
