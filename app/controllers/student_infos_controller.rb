class StudentInfosController < ApplicationController
    def index
        @schools = School.all
    end
    def get_branches
        @school = School.find params[:id]
        @branches = @school.branches
        respond_to do |format|
            format.json { render json: @branches}
        end
    end
    def get_standards
        @branch = Branch.find params[:branch_id]
        @standards = @branch.standards.where(school_id: params[:school_id])
        respond_to do |format|
            format.json { render json: @standards}
        end
    end
    def get_students
        @teacher = Teacher.find params[:teacher_id]
        @students = @teacher.students
         respond_to do |format|
            format.json { render json: @students}
        end
    end
    def get_teachers
        @teachers = Teacher.where(school_id: params[:school_id],
        branch_id: params[:branch_id], standard_id: params[:standard_id])
        respond_to do |format|
           format.json { render json: @teachers}
       end
    end
end
