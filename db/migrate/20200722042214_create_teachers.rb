class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :subject
      t.integer :school_id
      t.integer :branch_id
      t.integer :standard_id

      t.timestamps
    end
  end
end
