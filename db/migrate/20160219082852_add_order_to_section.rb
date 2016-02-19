class AddOrderToSection < ActiveRecord::Migration
  def change
    remove_column :sections, :short_description, :string
    add_column :sections, :description, :string
    add_column :sections, :order, :integer
  end
end
