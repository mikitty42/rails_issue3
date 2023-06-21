class AddEmailToPictures < ActiveRecord::Migration[6.1]
  def change
      add_column :pictures, :email, :string
  end
end
