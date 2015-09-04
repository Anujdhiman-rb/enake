class AuthenticationController < ApplicationController
  respond_to :json 
  # before_filter :authorize
  skip_before_filter :verify_authenticity_token, :only => :login
  
  
  def sign_in
    @user = User.new
  end

#  Sign up process   
  def register
    if params[:step] == 1
      @cliniko = Cliniko.new(params[:cliniko])
      if @cliniko.valid?
        @cliniko.save
        render :json=> {:user_id=> @cliniko.id , :cycle=> "1" } 
      else
        render :json=> {:error=> "Invalid data"} 
      end
    elsif params[:step]==2
      @cliniko = Cliniko.find(params[:cliniko][:cliniko_id])
      cliniko =  @user.update_attributes(:first_name=> params[:cliniko][:first_name], :last_name=> params[:cliniko][:last_name],:location=>params[:cliniko][:location])
      if cliniko
        session[:cliniko_id] = @cliniko.id
        render :json=> {:user_id=> @cliniko.id , :cycle=> "2" } 
      else
        render :json=> {:error=> "Invalid data"}
      end
    end
  end

  def login
    username_or_email = params[:authentication][:email]
    password = params[:authentication][:password]

    if username_or_email.include?('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end

    respond_to do |format|
      if user
        session[:user_id] = user.id
        session[:user_name] = user.first_name
        @result = {flag: true, user_id: user.id}
        format.any(:xml, :json) { render request.format.to_sym => @result } 
      else
        @result = {flag: false}
        format.any(:xml, :json) { render request.format.to_sym => @result }
      end  
    end
  end
  
  
#   method to get session at front end 
  def get_session
    if session[:user_id].present? && session[:user_name].present?
      @result = {flag:true , session_id: session[:user_id] , :user_name=> session[:user_name]}
      render :json=>@result
    else 
      @result = {flag:false}
      render :json=>@result
    end
  end
  
  def signed_out
    reset_session
    render :json=>{flag: false}
  end
  
end
