NasaHackathon::Application.routes.draw do
  root :to => "home#index", :via => :get
  match "crater_match", :to => "home#crater_match", :as => :crater_match, :via => :get
  match "crater_match_result", :to => "home#crater_match_result", :as => :crater_match_result, :via => :post
  match "contact", :to => "home#contact", :as => :contact, :via => :get
  match "crater_quiz", :to => "home#crater_quiz", :as => :crater_quiz, :via => :get
  match "crater_quiz_result/:id", :to => "home#crater_quiz_result", :as => :crater_quiz_result, :via => :get
  match "crater_api", :to => "home#crater_api", :as => :crater_api, :via => :get
  
  match "api/sphere", :to => "api#sphere"
  match "api/crater", :to => "api#crater"  
  match "api/sphere_list", :to => "api#sphere_list"
  match "api/crater_list", :to => "api#crater_list"

end
