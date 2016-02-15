class AddToFriendDependencySortingCourse < ActiveRecord::Migration
  def changefriend_dependency
    add_column :sorting_courses, :friends_dependency, :boolean, default: false
  end
end
