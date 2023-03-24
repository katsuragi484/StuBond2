class Parent::ChatsController < ApplicationController
  before_action :authenticate_parent!

  def create
    @chat = Chat.new
    @chat.parent_id = current_parent.id
    @chat.message = chat_params[:message]
    @chat.chatroom_id = chat_params[:chatroom_id]
    if @chat.save
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to parent_chatrooms_path

  end

  private

  def chat_params
    params.require(:chat).permit(:parent_id, :message, :chatroom_id)
  end
end
