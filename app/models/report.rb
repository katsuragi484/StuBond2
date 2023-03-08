class Report < ApplicationRecord
  has_many :homeworks, dependent: :destroy
  belongs_to :teacher
  belongs_to :student
  belongs_to :subject
end
