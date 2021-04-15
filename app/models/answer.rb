class Answer < ApplicationRecord
  belongs_to :next_question
  belongs_to :question
  belongs_to :recommendation
end
