class HomeController < ApplicationController
    
  def index
    if user_signed_in?
    @categories = Category.by_user(current_user).pluck(:id)
    @tasks = Task.includes(:category).where(category_id: @categories)
    @task_id = Task.includes(:category).where(category_id: @categories).pluck(:category_id)
    @categories_tasks = Category.find(@task_id)
    end
  end
end

