class Question < ApplicationRecord
  # after_initialize :init

  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: false

  # def init
  #   self.entry ||= false
  # end
end
