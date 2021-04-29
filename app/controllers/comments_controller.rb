class CommentsController < ApplicationController
    def create
        cant_comment_begin = Comment.all.count
        cant_comment_save = cant_comment_begin
        if params[:comment][:teacher_id].present?
            @teacher = Teacher.find(params[:comment][:teacher_id])
            @teacher.comments << Comment.new(content: params[:comment][:content_teacher])
            cant_comment_save = Comment.all.count
        elsif params[:comment][:student_id].present?
            @student = Student.find(params[:comment][:student_id])
            @student.comments << Comment.new(content: params[:comment][:content_student])
            cant_comment_save = Comment.all.count
        end
        respond_to do |format|
            notice = " OK !!!"  if cant_comment_save > cant_comment_begin
            notice = " Todos Los Campos Son Obligatorios"  if cant_comment_save == cant_comment_begin
            format.html { redirect_to root_path, notice: notice }
        end
    end
end
