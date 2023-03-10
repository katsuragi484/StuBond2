class Report < ApplicationRecord
  has_many :homeworks, dependent: :destroy
  belongs_to :teacher
  belongs_to :student
  belongs_to :subject

# コントローラにてパラメータ指定をする際にhomeworkのカラムを指定可能とする
  accepts_nested_attributes_for :homeworks

end
