class AddUserIdToBag < ActiveRecord::Migration
  def change
    add_column :bags, :user_id, :integer
  end
end
