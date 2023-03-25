class Student::HomeworksController < ApplicationController
  before_action :authenticate_student!

  def show
    @student = current_student
    @reports = Report.where(student_id: @student.id)
    @homeworks = Homework.where(report_id: @reports.ids).page(params[:page])
  end
  def done
    homework = Homework.find(params[:homework_id])
    homework.is_completed = !homework.is_completed
    homework.save
    redirect_to student_report_path(homework.report_id)
  end
end
