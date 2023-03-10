class Student::ReportsController < ApplicationController

  def new
    @report = Report.new
    @subjects = Subject.all
  end

  def index

  end

  def show

  end

  def edit

  end

  def update

  end
end
