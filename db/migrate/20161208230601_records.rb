class Records < ActiveRecord::Migration[5.0]
  def change
  	change_table :records do |t|
      t.float :latitude
      t.float :longitude
  	end
  end
end
