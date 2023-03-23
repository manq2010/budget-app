class RenameUserIdToAuthorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :expenses, :user_id, :author_id
  end
end
