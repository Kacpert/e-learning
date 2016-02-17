class SortingCoursesService
  def initialize(filter, user)
    @filter = filter
    @user = user
  end

  def from_date courses
    courses.where('created_at >= ?', @filter.from_date)
  end

  def courses
    courses = (@filter.user_dependency && @user ) ? @user.courses : Course.all
    courses = from_date courses if @filter.from_date.present?
    return courses
  end
end