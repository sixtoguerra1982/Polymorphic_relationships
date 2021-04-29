class HomeController < ApplicationController
  def index
    @comments = Comment.all
    @students = Student.by_name
    @teachers = Teacher.by_name
    @comment = Comment.new
  end
end
