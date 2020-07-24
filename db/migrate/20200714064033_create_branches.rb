class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :location
      t.text :address
      t.integer :school_id
      
      t.timestamps
    end
  end
end
