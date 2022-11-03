class RemoveNameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :photo, :string
  end
end
