class ApiController < ApplicationController

  def sphere
    sphere = Sphere.find(params[:sphere_id])
    render :json => sphere.to_json(:except => [:created_at, :updated_at])
  end

  def crater
    crater = Crater.find(params[:crater_id])
    render :json => crater.to_json(:except => [:created_at, :updated_at])
  end

  def sphere_list
    @spheres = Sphere.select("id, name")
    render :json => @spheres
  end

  def crater_list
    @craters = Crater.where(:sphere_id => params[:sphere_id]).offset(params[:offset])
      .select("id, name, image_url, latitude, longitude").limit(params[:count] ? params[:count] : 20)
    render :json => @craters
  end

end
