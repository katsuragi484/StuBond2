class Student::StudentsController < ApplicationController

  def show
    @student = current.student
  end
end
