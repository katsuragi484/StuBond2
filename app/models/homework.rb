class Homework < ApplicationRecord
  belongs_to :report
  enum completed_method: {not_started_yet: 0,in_progress: 1,not_sure: 2,completed: 3 }
end
