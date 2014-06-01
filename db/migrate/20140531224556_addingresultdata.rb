class Addingresultdata < ActiveRecord::Migration
  def change
  	 add_column :students, :grade, :string
  	 add_column :students, :explainer_text, :string
  end
end
