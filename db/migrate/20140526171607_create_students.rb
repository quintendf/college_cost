class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :college
      t.string :major
      t.integer :cost
      t.decimal :scholarships
      t.decimal :contribution

      t.timestamps
    end
  end
end
