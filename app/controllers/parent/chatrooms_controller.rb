class Parent::ChatroomsController < ApplicationController
  before_action :authenticate_parent!

  def index
    @students = Student.where(parent_id: current_parent.id).page(params[:page])
  end

  def show
    @student = Student.find_by(id: params[:id])
    @parent = Parent.find_by(id: current_parent.id)
    if Chatroom.find_by(student_id: @student.id).present?
      @chatroom = Chatroom.find_by(student_id: @student.id)
      @chats = Chat.where(chatroom_id: @chatroom.id)
      @chat = Chat.new
    else
      flash[:notice] = "塾側にチャットルーム作成を依頼してください。"
      redirect_to my_page_parent_parents_path
    end
  end
end
