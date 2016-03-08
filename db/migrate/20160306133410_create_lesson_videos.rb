class CreateLessonVideos < ActiveRecord::Migration
  def change
    create_table :lesson_videos do |t|
      t.string :url
      t.references :lecture, index: true
      t.references :lesson, index: true

      t.timestamps null: false
    end
  end
end
