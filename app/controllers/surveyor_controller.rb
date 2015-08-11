# encoding: UTF-8
require 'application_helper'
module SurveyorControllerCustomMethods
  def self.included(base)
    # base.send :before_filter, :require_user   # AuthLogic
    # base.send :before_filter, :login_required  # Restful Authentication
    # base.send :layout, 'surveyor_custom'
  end

  # Actions
  def new
    super
    # @title = "You can take these surveys"
  end
  def create
    super

	cookie_id = ::ApplicationHelper::get_cookie_id(cookies)

	@response_set.cookie = cookie_id
	@response_set.save	
  end
  def show
    super
  end
  def edit
    super
  end
  def update
    super
  end
  # Paths
  def surveyor_index
    # most of the above actions redirect to this method
    super # surveyor.available_surveys_path
  end
  def surveyor_finish
    # the update action redirects to this method if given params[:finish]
    #super # surveyor.available_surveys_path
    "/utils/submit" 
  end
end

class SurveyorController < ApplicationController
  include Surveyor::SurveyorControllerMethods
  include SurveyorControllerCustomMethods
end
