class Parent::ChatroomsController < ApplicationController

  def show
    @parent = current_parent
    @chatroom = Chatroom.find_by(id: params[:id],parent_id: current_parent.id)
    if @chatroom.present?
      @chats = Chat.where(room_id: @chatroom.id)
      @chat = Chat.new
    else
      redirect_back(fallback_location: root_path)
    end
  end

end
