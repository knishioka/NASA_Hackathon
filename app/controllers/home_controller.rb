class HomeController < ApplicationController
  def index
  end

  def crater_match
    @craters = Crater.order("random()").where("image_url IS NOT NULL").limit(10)
  end

  def crater_match_result
    sphere_id = Crater.where(:id => params[:selected_crater].values).pluck(:sphere_id).sample
    @sphere = Sphere.find(sphere_id)
  end

  def crater_quiz
    @sphere = Sphere.order("random()").first
    @craters = []
    session[:sphere_id] = @sphere.id
    Sphere.pluck(:id).each do |id|
      @craters << Crater.where("image_url IS NOT NULL").where(:sphere_id => id).order("random()").first
    end
  end

  def crater_quiz_result
    @result = (session[:sphere_id] == Crater.find(params[:id]).sphere_id)
  end

  def contact
  end
end
