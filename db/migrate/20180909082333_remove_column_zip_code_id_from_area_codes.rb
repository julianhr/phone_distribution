class RemoveColumnZipCodeIdFromAreaCodes < ActiveRecord::Migration[5.2]
  def change
    remove_column :area_codes, :zip_code_id
  end
end
