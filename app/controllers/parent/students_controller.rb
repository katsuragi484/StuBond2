class Parent::StudentsController < ApplicationController
  before_action :authenticate_parent!

end
