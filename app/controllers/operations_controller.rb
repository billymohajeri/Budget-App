class OperationsController < ApplicationController
  before_action :redirect_unauthenticated_user_to_custom_page

  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @operations = current_user.operations.includes(:category).where(category: @category)
      @total_amount = @operations&.sum(:amount) || 0
    else
      @operations = current_user.operations
    end
    @page_name = 'Transactions'
  end

  def new
    @operation = current_user.operations.build
    @categories = current_user.categories
    @category = Category.find(params[:category_id]) if params[:category_id].present?
    @page_name = 'Transactions'
  end

  def create
    @operation = current_user.operations.build(operation_params)
    @categories = current_user.categories
    @category = Category.find(params[:operation][:category_id]) if params[:operation][:category_id].present?
    @operation.category = @category
    if @operation.save
      Categorization.create(operation: @operation, category: @category)
      redirect_to category_operations_path(@operation.category)
    else
      puts @operation.errors.full_messages
      render :new
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, :category_id, :author_id)
  end

  def redirect_unauthenticated_user_to_custom_page
    return if user_signed_in?

    redirect_to '/users/'
  end
end
