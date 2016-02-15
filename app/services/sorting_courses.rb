class SortingCourses
  def initialize(filter, user)
    @filter = filter
    @user = user
  end

  def user_filter
    @user.courses
  end

  def courses
    user_filter if @filter.user_dependency
  end
end