class Parent::ChatroomsController < ApplicationController
  before_action :authenticate_parent!

  def index
    @students = Student.where(parent_id: current_parent.id)
  end

  def show
  #   @parent = current_parent
  #   @chatroom = Chatroom.find_by(id: params[:id],parent_id: current_parent.id)
  #   if @chatroom.present?
  #     @chats = Chat.where(room_id: @chatroom.id)
  #     @chat = Chat.new
  #   else
  #     redirect_back(fallback_location: root_path)
  #   end
  # end

    @student = Student.find_by(id: params[:id])
    @parent = Parent.find_by(id: current_parent.id)
    if Chatroom.find_by(student_id: @student.id).present?
      @chatroom = Chatroom.find_by(student_id: @student.id)
    else
      flash[:notice] = "塾側にチャットルーム作成を依頼してください。"
    end

    #byebug
    @chats = Chat.where(chatroom_id: @chatroom.id)
    @chat = Chat.new
  end
end
