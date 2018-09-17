class AddImagesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :cover_image, :string
  end
end
