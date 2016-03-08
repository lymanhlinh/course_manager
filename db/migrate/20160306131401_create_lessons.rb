class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :description
      t.integer :index
      t.references :course, index: true

      t.timestamps null: false
    end
  end
end
