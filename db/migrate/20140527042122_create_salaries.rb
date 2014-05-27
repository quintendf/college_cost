class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.string :major
      t.decimal :starting_salary
      t.decimal :mid_career_salary

      t.timestamps
    end
  end
end
