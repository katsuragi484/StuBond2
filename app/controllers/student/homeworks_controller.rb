class Student::HomeworksController < ApplicationController
  def show
    @student = current_student
    @reports = Report.where(student_id: @student.id)
    @homeworks = Homework.where(report_id: @reports.ids)
  end
  def done
    homework = Homework.find(params[:homework_id])
    if homework.completed == !homework.completed
    homework.save
    redirect_to student_report_path(homework.report_id)
  end
end
