class Admin::ChatsController < ApplicationController
  def create
    # if Chat.where(admin_id: current_admin.id, chatroom_id: params[:chat][:chatroom_id]).present?
    #   @chat = Chat.create(params.require(:chat).permit(:admin_id, :message, :chatroom_id).merge(admin_id: current_admin.id))
    # else
    #   flash[:alert] = "メッセージ送信に失敗しました。"
    # end
    # redirect_to admin_chatrooms_path

    if Chat.where(admin_id: current_admin.id, chatroom_id: params[:chat][:chatroom_id]).present?
      @chat = Chat.create(params.require(:chat).permit(:admin_id, :message, :chatroom_id).merge(admin_id: current_admin.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to admin_chatrooms_path

  end

  private

  def chat_params
    params.require(:chat).permit(:admin_id, :message, :chatroom_id)
  end
end
