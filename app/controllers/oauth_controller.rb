class OauthController < ApplicationController

  def start
    redirect_to client.authorization.authorize_url(:redirect_uri => 'http://localhost:3000/oauth/callback'  , :scope => '')
    #redirect_to client.authorization.authorize_url(:redirect_uri => APP_CONFIG.url + '/oauth/callback', :scope => '')
  end

  def callback
    access_token = client.authorization.process_callback(params[:code], :redirect_uri => 'http://localhost:3000/oauth/callback')
    session[:access_token] = access_token
    user_json = client.selection.me.info!
    session[:name] = user_json.name
    User.create(:login => user_json.id, :email => user_json.id, :name => user_json.name) unless User.exists?(:login => user_json.id)
    session[:user_id] = User.where({ :login => user_json.id }).first.id

    redirect_to :controller => 'welcome', :action => 'index'
  end

  def oclient
    OAuth2::Client.new('114709451898747','7c87164749a02552e3d204142e3af16b', :site => 'https://graph.facebook.com')
  end

  def register_
    render :json => client.selection.me.info!
  end

end
