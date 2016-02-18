class ChangeColumnNameFromLongDescriptionToShortDescriptionInCourse < ActiveRecord::Migration
  def change
    rename_column :courses, :long_description, :short_description
  end
end
