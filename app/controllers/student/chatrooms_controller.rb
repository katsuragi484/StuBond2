class Student::ChatroomsController < ApplicationController
  before_action :authenticate_student!

  def show
    @student = current_student
    @parent = Parent.find_by(id: @student.parent_id)
    if Chatroom.find_by(student_id: @student.id).present?
      @chatroom = Chatroom.find_by(student_id: @student.id)
      @chats = Chat.where(chatroom_id: @chatroom.id)
      @chat = Chat.new
    else
      flash[:notice] = "塾側にチャットルーム作成を依頼してください。"
      redirect_to my_page_student_students_path
    end
  end
end
