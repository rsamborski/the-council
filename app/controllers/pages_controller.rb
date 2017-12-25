class PagesController < ApplicationController
  before_action :authenticate_user!, :only => :secret

  def index
  end

  def secret
    @email = current_user.email
    @admin = current_user.admin?.to_s
  end

  def apidocs
    render 'swagger_ui/_swagger_ui', discovery_url: '/api/swagger_doc'
  end
end
