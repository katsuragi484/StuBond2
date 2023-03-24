class Student::ChatsController < ApplicationController
  before_action :authenticate_student!

  def create
    @chat = Chat.new
    @chat.student_id = current_student.id
    @chat.message = chat_params[:message]
    @chat.chatroom_id = chat_params[:chatroom_id]
    if @chat.save
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to student_chatroom_path(1)

  end

  private

  def chat_params
    params.require(:chat).permit(:student_id, :message, :chatroom_id)
  end
end
