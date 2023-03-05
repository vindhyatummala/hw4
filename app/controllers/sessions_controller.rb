class SessionsController < ApplicationController
  
  def new
  end

    def create
        @user = User.find_by({"email" => params["email"]})
        if @user
            if params["password"] == @user["password"]
                redirect_to "/places"
            else 
                redirect_to "/sessions/new"
            end
        else
            redirect_to "/sessions/new"
        end
    end

  def destroy
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/login"
  end

end
  