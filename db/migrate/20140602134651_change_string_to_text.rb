class ChangeStringToText < ActiveRecord::Migration
  def change
  	change_column :students, :college, :text
  	change_column :students, :major, :text
  	change_column :students, :explainer_text, :text
  	change_column :students, :grade, :text
  end
end
