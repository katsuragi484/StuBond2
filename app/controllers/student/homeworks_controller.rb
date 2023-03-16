class Student::HomeworksController < ApplicationController
  def show
    @student = current_student
    @reports = Report.where(student_id: @student.id)
    @homeworks = Homework.where(report_id: @reports.ids)
  end
end
