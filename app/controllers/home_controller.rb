# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  def index
  end

  def crater_match
    @craters = Crater.order("random()").where("image_url IS NOT NULL").limit(10)
  end

  def crater_match_result
    if params[:selected_crater].nil? or params[:selected_crater].size < 5
      redirect_to crater_match_path, notice: "5つ全てを選択してください"
      return
    end
    sphere_id = Crater.where(:id => params[:selected_crater].values).pluck(:sphere_id).sample
    params[:selected_crater].values.each do |crater_id|
      CraterLikeCount.find_or_initialize_by_crater_id(crater_id).increment(:like_count).save!
    end
    max = Crater.where(:sphere_id => sphere_id).joins(:crater_like_count).select("MAX(like_count) AS count")[0].count
    @popular_crater = Crater.joins(:crater_like_count).where(:sphere_id => sphere_id, :crater_like_counts => { :like_count => max})
    .order("random()").first
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
