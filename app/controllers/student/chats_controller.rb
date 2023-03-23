class Student::ChatsController < ApplicationController
  before_action :authenticate_student!

  def create
    if Chatroom.where(student_id: current_student.id, room_id: params[:chat][:room_id]).present?
      @chat = Chat.create(params.require(:chat).permit(:student_id, :message, :room_id).merge(student_id: current_student.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
　　redirect_to student_chatroom_path
  end

  # private

  # def chat_params
  #   params.require(:chat).permit(:chat, :student_id, :parent_id)
  # end

end
