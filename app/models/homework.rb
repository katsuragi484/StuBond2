class Homework < ApplicationRecord
  belongs_to :report
  enum completed: {incomplete: 0, complete: 1}
end
