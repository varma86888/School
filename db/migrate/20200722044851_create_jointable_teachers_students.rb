class CreateJointableTeachersStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :jointable_teachers_students do |t|
      create_join_table :teachers, :students
    end
  end
end
