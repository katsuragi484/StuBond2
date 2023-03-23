class Admin::ChatroomsController < ApplicationController
  before_action :authenticate_admin!


  def index
    @students = Student.all
  end


  def show
    @student = Student.find_by(id: params[:id])
    @parent = Parent.find_by(id: @student.parent_id)
    if Chatroom.find_by(student_id: @student.id).present?
      @chatroom = Chatroom.find_by(student_id: @student.id)
    else
      # チャットルームがない場合は新規作成する
      @chatroom = Chatroom.create(admin_id: current_admin.id, student_id: @student.id, parent_id: @student.parent_id)
    end
    
    #byebug
    @chats = Chat.where(chatroom_id: @chatroom.id)
    @chat = Chat.new

  end

end
