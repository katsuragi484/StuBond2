class Parent::ParentsController < ApplicationController
  before_action :authenticate_parent!

  def show
    @parent = current_parent
  end

  def edit
    @parent = current_parent
  end

  def update
    @parent = current_parent
    if @parent.update(parent_params)
      redirect_to my_page_parent_parents_path
    else
      render :edit, notice: "変更に失敗しました"
    end
  end

  private

  def parent_params
    params.require(:parent).permit(:email, :code)
  end

end
