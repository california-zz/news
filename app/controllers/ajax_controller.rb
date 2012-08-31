class AjaxController < ApplicationController
skip_before_filter :verify_authenticity_token
  def edit_article

  	 @detail_post = Post.find(params[:id])
     if !session[:Session_User].nil?
	     respond_to do |format|
	        if !@detail_post.nil?  
	           format.json  { render :json =>  @detail_post }
	        else
	            format.json { render :json => "" }
	      	end
	  	end
    else
      redirect_to root_path
    end
  end

    def set_edit_article
    	 if !session[:Session_User].nil?
	    	@post = Post.find(params["id"])
	    	@temp = {"title"=>params["title"],"content" =>params["content"]}
	    	if !@post.nil?
	    		if  @post.update_attributes(@temp)
		              respond_to do |format| 
		              	format.json { render :json => "success" }
		              end
	               return
	            end
	    	end
	    	respond_to do |format|
				format.json { render :json => "tao2 lao" }
			end
		end
    
  	end

end
