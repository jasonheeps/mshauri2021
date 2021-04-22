class AllowNullForRecommendationInAnswers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :answers, :recommendation_id, true
  end
end
