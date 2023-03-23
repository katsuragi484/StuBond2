class Student::ChatroomsController < ApplicationController

  def show
    @student = current_student
    @parent = Parent.find_by(id: @student.parent_id)
    @chatroom = Chatroom.find_by(id: params[:id],student_id: current_student.id)
    if @chatroom.present?
      @chats = Chat.where(room_id: @chatroom.id)
      @chat = Chat.new
    else
      redirect_back(fallback_location: root_path)
    end
  end

  # private

  # def chatroom_params
  #   params.require(:chatroom).permit(:admin_id, :student_id, :parent_id)
  # end

end
