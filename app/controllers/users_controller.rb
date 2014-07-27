class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create    
    @user = User.new(params.require(:user).permit!)
    if @user.save
      @user.send_reset_password_instructions
      respond_to do |format|
        format.html { redirect_to users_path, notice: "User was successfully created. Reset password instructions have been sent to #{@user.email}" }
      end
    else
      flash[:error] = "Unable to add new user due to validation errors"
      respond_to do |format|
        format.html { render action: "new"   }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
    begin
      user = User.destroy(params[:id])
      flash[:notice] = "#{user.login} has been removed successfully"
    rescue => e
      flash[:error] = "Unable to remove user because of '#{e.message}' error"
    end
    redirect_to users_path
  end

  def reset_password
    begin
      user = User.find(params[:id])
      user.send_reset_password_instructions
      model = {:type => :info, :message => "Reset password instructions have been sent to #{user.email}"}
    rescue => e
      model = {:type => :error, :message => "Couldn't sent reset password instructions because of #{e}"}
    end
    #redirect_to users_path
    respond_to do |format|
    format.json{
      render :json => model.to_json
    }
  end    
  end
end
