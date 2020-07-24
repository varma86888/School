class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.date :dob
      t.integer :school_id
      t.integer :branch_id
      t.integer :standard_id

      t.timestamps
    end
  end
end
