class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :document_type
      t.attachment :file
      t.references :course, index: true

      t.timestamps null: false
    end
  end
end
