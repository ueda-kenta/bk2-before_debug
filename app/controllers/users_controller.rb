class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @currentUserEntry=UserRoom.where(user_id: current_user.id)
    @userEntry=UserRoom.where(user_id: @user.id)
    @books = @user.books
    @book = Book.new
    # DM関連
    unless @user.id == current_user.id
      @currentUserEntry.each do |cuser|
        @userEntry.each do |user|
          if cuser.room_id == user.room_id then
            @isRoom = true
            @roomId = cuser.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = UserRoom.new
      end
    end
    # DM関連終わり
  end

  def index
    @users = User.all
    @book = Book.new
  end
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def show_follow
    @user = User.find(params[:id])
  end

  def show_follower
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :postal_code, :prefecture_code, :city, :street)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
