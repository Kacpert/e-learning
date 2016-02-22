class AddAttachmentImageToVideoLessons < ActiveRecord::Migration
  def self.up
    change_table :video_lessons do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :video_lessons, :image
  end
end
