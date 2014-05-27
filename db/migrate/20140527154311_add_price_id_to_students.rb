class AddPriceIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :price_id, :integer
  end
end
