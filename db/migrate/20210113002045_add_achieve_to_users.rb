class AddAchieveToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :achieve, :string
  end
end
