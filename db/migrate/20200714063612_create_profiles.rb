class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :gender
      t.date :dob
      t.integer :age

      t.timestamps
    end
  end
end
