class AddImageToPrototypes < ActiveRecord::Migration[6.1]
  def change
    add_column :prototypes, :image, :string
  end
end
