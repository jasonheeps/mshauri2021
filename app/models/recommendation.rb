class Recommendation < ApplicationRecord
  has_many :answers, dependent: :nullify
  has_many :iteration_answers, through: :answers
  has_many :iterations, through: :iteration_answers

  validates :title, :description, :identifier, presence: true
  validates :identifier, uniqueness: true

  scope :general, -> { where(general: true) }

  # not sure if this is needed? from original app
  # def description_formatted
  #   markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, no_intra_emphasis: true)
  #   markdown.render(description.to_s)
  # end
end
