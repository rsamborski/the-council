class WelcomeController < ApplicationController
  before_action :authenticate_user!, :only => :secret

  def index
  end

  def secret
    @email = current_user.email
    @admin = current_user.admin?.to_s
  end
end
