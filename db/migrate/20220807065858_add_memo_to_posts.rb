class AddMemoToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :memo, :string
  end
end
