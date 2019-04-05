class RiddlesController < ApplicationController
  before_action :logged_in, only: [:new, :create]

  def index
    @riddles = Riddle.all
  end

  def new
    @riddle = Riddle.new
  end

  def create
    @riddle = Riddle.new(riddle_params)
    @riddle.user = current_user
    if @riddle.save
      flash[:success] = "Your riddle has been published"
      redirect_to root_url
    else
      render "new"
    end
  end

  private

  def riddle_params
    params.require(:riddle).permit(:body, :answer, :user)
  end

  def logged_in
    redirect_to root_url unless logged_in?
  end
end
