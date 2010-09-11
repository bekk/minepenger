
class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  protected

  def client
    @client ||= FBGraph::Client.new(:client_id => '135135796529068',
                                   :secret_id => 'dd5ecf14197237e9fbc4627f7edb0da6' ,
                                   :token => session[:access_token])
  end
end
