class ProblemsController < ApplicationController
  before_action :logged_in, only: [:new, :create]

  def index
    @problems = Problem.all
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    @problem.user = current_user
    if @problem.save
      flash[:success] = "Your problem has been published"
      redirect_to root_url
    else
      render "new"
    end
  end

  private

  def problem_params
    params.require(:problem).permit(:body, :answer, :user)
  end

  def logged_in
    redirect_to root_url unless logged_in?
  end
end
