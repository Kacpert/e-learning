class AddTemporalToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :temporal, :boolean, default: :false
  end
end
