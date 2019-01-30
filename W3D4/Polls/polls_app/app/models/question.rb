class Question < ApplicationRecord
  validates :poll_id, :text, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    primary_key: :id, 
    foreign_key: : answer_choice_id,
    class_name: :AnswerChoice
end
