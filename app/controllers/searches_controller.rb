class SearchesController < ApplicationController
  def search
    @courses = Course.search(params[:q])
  end
end
