class Parent::ChatsController < ApplicationController
  def create
    if Chatroom.where(parent_id: current_parent.id, room_id: params[:chat][:room_id]).present?
      @chat = Chat.create(params.require(:chat).permit(:parent_id, :message, :room_id).merge(parent_id: current_parent.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
　　redirect_to student_chatroom_path
  end
end
