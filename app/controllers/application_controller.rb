class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :turbo_frame_request_variant



  protected
  def after_sign_up_path_for(resource)
     # @FIXME boards_index_path
  end

  def turbo_frame_request_variant
      request.variant = :turbo_frame if turbo_frame_request?
    end
    
end