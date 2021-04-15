class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :description
      t.boolean :entry, default: false
      t.string :identifier
      t.boolean :multiple
      t.boolean :other

      t.timestamps
    end
  end
end
