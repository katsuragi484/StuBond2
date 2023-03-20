class Subject < ApplicationRecord
  has_many :reports, dependent: :destroy

  def self.search(search)
    if search
      where('subject_name LIKE ?', "%#{search}%")
    else
      all
    end
  end


end
