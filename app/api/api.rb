module API
  class Root < Grape::API
    prefix :api
    mount V1::Users::Users
    # mount V2::Base
  end
end