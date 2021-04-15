class CreateIterationAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :iteration_answers do |t|
      t.references :iteration, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
