class ProblemsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  before_action :correct_user, only: :destroy

  def index
    @problems = Problem.order(created_at: :desc)
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

  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    flash[:success] = "Problem destroyed"
    redirect_to root_url
  end

  private

  def problem_params
    params.require(:problem).permit(:body, :answer, :picture)
  end

  def correct_user
    @problem = Problem.find(params[:id])
    redirect_to root_url unless @problem.user == current_user
  end
end
