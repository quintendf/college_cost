class LinkCosts < ActiveRecord::Migration
  def change
  	drop_table :students

    create_table :students do |t|
      t.string :college
      t.string :major
      t.decimal :scholarships
      t.decimal :contribution
      t.decimal :yearly_cost
      t.decimal :total_debt
      t.decimal :monthly_cost
      t.decimal :monthly_salary
      t.timestamps
    end
  end
end
