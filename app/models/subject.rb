class Subject < ApplicationRecord
  has_many :reports, dependent: :destroy
  validates :subject_name, presence: true

  def self.search(search)
    if search
      where('subject_name LIKE ?', "%#{search}%")
    else
      all
    end
  end


end
