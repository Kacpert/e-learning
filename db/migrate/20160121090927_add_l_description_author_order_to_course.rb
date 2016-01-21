class AddLDescriptionAuthorOrderToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :long_description, :text
    add_column :courses, :author, :string
    add_column :courses, :order, :integer
    add_reference :courses, :user, index: true, foreign_key: true
  end
end
