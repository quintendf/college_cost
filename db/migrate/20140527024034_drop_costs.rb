class DropCosts < ActiveRecord::Migration
def up
    drop_table :costs
  end

  def down
  end
end