class CategoriesController < ApplicationController
  before_action :redirect_unauthenticated_user_to_custom_page

  def index
    @categories = current_user.categories.includes(:operations)
    @operations_by_category = {}
    @categories.each do |category|
      operations = Operation.where(category_id: category.id)
      @operations_by_category[category.id] = operations
    end

    @total_amount_by_category = {}
    @categories.each do |category|
      operations = @operations_by_category[category.id]
      @total_amount_by_category[category.name] = operations.sum(:amount)
    end
    @page_name = 'Categories'
  end

  def show
    @category = Category.includes(:operations).find(params[:id])
    @operations = @category.operations
    @total_amount = @operations.sum(:amount)
    @page_name = 'Categories'
  end

  def new
    @category = Category.new
    @page_name = 'New Category'
  end

  def create
    @category = current_user.categories.build(category_params)

    if Category.exists?(name: @category.name, user_id: current_user.id)
      flash[:notice] = 'Category already exists'
      render :new
    elsif @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :user_id)
  end

  def redirect_unauthenticated_user_to_custom_page
    return if user_signed_in?

    redirect_to '/users/'
  end
end
