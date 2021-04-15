class IterationAnswer < ApplicationRecord
  belongs_to :iteration
  belongs_to :question
  belongs_to :answer
end
