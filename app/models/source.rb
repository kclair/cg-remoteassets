class Source < ActiveRecord::Base

  include ActionController::UrlWriter

  belongs_to :asset

end
