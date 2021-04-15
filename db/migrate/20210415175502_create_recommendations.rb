class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.string :title
      t.text :description
      t.string :category
      t.integer :priority
      t.string :identifier
      t.text :intro
      t.boolean :general, default: false

      t.timestamps
    end
  end
end
