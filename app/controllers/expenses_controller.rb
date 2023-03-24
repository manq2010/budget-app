class ExpensesController < ApplicationController
  before_action :set_group, only: %i[new create edit update destroy]
  before_action :set_expense, only: %i[edit update destroy]

  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def new
    @group = Group.find(params[:group_id])
    @expense = Expense.new
  end

  def edit
    @group = Group.find(params[:group_id])
  end

  def create
    # @expense = Expense.new(expense_params)
    @expense = Expense.new(expense_params)
    @expense.author_id = current_user.id
    @expense.groups = Group.where(id: params[:expense][:group_ids]).includes([:user])
    
    respond_to do |format|
      if @expense.save
        format.html { redirect_to group_path(id: params[:expense][:group_ids].last), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to group_path(@group), notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to group_path(@group), notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
    @group = @expense.groups.first
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, group_ids: [])
  end  
end
