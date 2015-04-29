class ChangeSchoolsIdToSchoolId < ActiveRecord::Migration
  def change
  	rename_column :comments, :schools_id, :school_id 
  end
end
