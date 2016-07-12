class AddTextColumn < ActiveRecord::Migration
  def change
  	add_column :blogs, :text, :string
  end
end
