class Admin::ChatsController < ApplicationController
  before_action :authenticate_admin!

  def create

    #byebug
    @chat = Chat.new()
    @chat.admin_id = current_admin.id
    @chat.message = chat_params[:message]
    @chat.chatroom_id = chat_params[:chatroom_id]

    if @chat.save()

    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    chatroom = Chatroom.find_by(id: @chat.chatroom_id)
    redirect_to admin_chatroom_path(chatroom.student_id)

  end

  private

  def chat_params
    params.require(:chat).permit(:admin_id, :message, :chatroom_id)
  end
end
