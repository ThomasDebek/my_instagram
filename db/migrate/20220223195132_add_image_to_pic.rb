class AddImageToPic < ActiveRecord::Migration[7.0]
  def change
    add_column :pics, :image, :string
  end
end
