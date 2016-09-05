class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :load_tags

  protected

  def load_tags
    @tags_arr_names = Tag.pluck(:name)
  end
end
