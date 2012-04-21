class HomeController < ApplicationController
  def index
  end

  def crater_match
    @craters = Crater.order("random()").where("image_url != \"no image\"").limit(10)
  end

  def crater_match_result
    sphere_id = Crater.where(:id => params[:selected_crater].values).pluck(:sphere_id).sample
    @sphere = Sphere.find(sphere_id)
  end

  def crater_quiz
    @sphere = Sphere.first
  end

  def contact
  end
end
