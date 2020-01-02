class AddZipCodeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :zip_code, :string
  end
end
