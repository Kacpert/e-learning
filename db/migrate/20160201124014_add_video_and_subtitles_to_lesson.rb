class AddVideoAndSubtitlesToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :video_url, :string
    add_column :lessons, :subtitles_url, :string
  end
end
