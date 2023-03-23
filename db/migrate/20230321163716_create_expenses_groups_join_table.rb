class CreateExpensesGroupsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses_groups, id: false do |t|
      t.belongs_to :expense
      t.belongs_to :group
    end

    add_index :expenses_groups, [:expense_id, :group_id], unique: true
  end
end
