class ApiController < ApplicationController
  def sphere
    sphere = Sphere.find(params[:sphere_id])
    render :json => sphere.to_json(:except => [:created_at, :updated_at])
  end
  def crater
    crater = Crater.find(params[:crater_id])
    render :json => crater.to_json(:except => [:created_at, :updated_at])
  end
end
