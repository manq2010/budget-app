class ExpensesController < ApplicationController
  before_action :set_group, only: %i[new create edit update destroy]
  before_action :set_expense, only: %i[edit update destroy]

  # def index
  #   @group = Group.find(params[:group_id])
  #   @expenses = @group.expenses.where(author_id: current_user.id)
  # end

  def index
    @expenses = Expense.all
  end

  # GET /expenses/new
  def new
    @group = Group.find(params[:group_id])
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses
  # POST /expenses.json
  def create
    @group = Group.find(params[:group_id])
    @expense = current_user.expenses.new(expense_params)
    @expense.author_id = current_user.id

    @my_group_object = Group.find_by(id: params[:group_id])

    @my_group_object.expenses << [@expense]

    respond_to do |format|
      if @expense.save
        format.html { redirect_to group_path(@group), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
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

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to group_path(@group), notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
    @group = @expense.groups.first
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :author_id)
  end
end
