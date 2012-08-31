class UserController < ApplicationController
 #profile 
  def index

    @title="Home"
    time= Time.new
  	if !session[:Session_User].nil? 
      @user = User.find(session[:Session_User][:id])
        if !params[:user].nil?
            if !params[:user][:note].nil?
              original_filename = params[:user][:note]
              @temp = params[:user]
              path = "#{RAILS_ROOT}/public/images/"+session[:Session_User][:id].to_s()+"_"+time.usec.to_s()+".png"
              File.open(path, "w+") do |f|
                    f.write params[:user][:note].read
              end
               params[:user][:note] = "/images/"+session[:Session_User][:id].to_s()+"_"+time.usec.to_s()+".png"
            else
              params[:user][:note] =  @user[:note]
            end
         
            @user.type = "edit"
            if  @user.update_attributes(params[:user])
                flash[:success] = "Invalid UserName/Password."
                @title = "profile"
                redirect_to profile_path
            end
        end
      else
      redirect_to root_path
  	end
  end

# register account
  def register
    # check session
    if session[:Session_User].nil? 
          @title="Register"

          @user = User.new(params[:user])
          if !params[:user].nil?
            @user.type = "register"
            if @user.save
                flash[:success] = "User created."
                redirect_to success_path
            end
          end
    else
        #tranfer to homepage
       redirect_to root_path
    end
  end

# login account
  def login
     @title="Login"
    # check session 
     if session[:Session_User].nil? 
        # check form post
          if !params[:user].nil? 
            user = User.authenticate(params[:user][:username],params[:user][:password])
            if user.nil?
                
                flash[:error] = "Invalid UserName/Password." 
                render 'login'
            else
                session[:Session_User]= user
                redirect_to root_path

            end
          end
      else
         redirect_to root_path
      end

  end

# Logout account
  def logout
     @title = "Logout"
     if !session[:Session_User].nil? 
        session[:Session_User] = nil;
        redirect_to root_path
    else
        session[:Session_User] = nil;
        redirect_to login_path
    end


  end

   def success
  end


   def change
      if !session[:Session_User].nil? 
       @title="change password"
       @user = User.find(session[:Session_User][:id])
       @user.type = "change"
       
       if !params[:user].nil?
         if @user[:password] == Digest::MD5.hexdigest(params[:user][:old_password])
              if @user.update_attributes(params[:user])
                  flash[:success] = "Change Password success"
                  flash[:error] = nil
              end
          else
            flash[:error] = "invalid Old Password."
         end

        else
           flash[:error] = "Old Password  can't be blank"
       end

     else
        redirect_to login_path
     end
       
  end
 


end
