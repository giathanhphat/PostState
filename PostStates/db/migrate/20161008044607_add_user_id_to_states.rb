class AddUserIdToStates < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :user_id, :integer
  end
end
