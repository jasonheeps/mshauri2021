class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :next_question, null: false, foreign_key: { to_table: :questions }
      t.references :question, null: false, foreign_key: true
      t.string :value
      t.boolean :input, default: false
      t.float :score
      t.references :recommendation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
