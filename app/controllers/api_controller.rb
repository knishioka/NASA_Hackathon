class ApiController < ApplicationController
  def sphere
    render :json => {:size => 0}
  end
  def crater
    render :json => { :name => "aa", :image_url => "http://"}
  end
end
