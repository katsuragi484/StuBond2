class Report < ApplicationRecord
  has_many :homeworks, dependent: :destroy
  belongs_to :teacher
  belongs_to :student
  belongs_to :subject

# コントローラにてパラメータ指定をする際にhomeworkのカラムを指定可能とする
# reject_ifは、子モデルが空である場合、そのモデルを無視する
  accepts_nested_attributes_for :homeworks, reject_if: :all_blank

  def self.search(search)
    if search
      where('title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end

end
