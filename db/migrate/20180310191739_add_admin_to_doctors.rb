class AddAdminToDoctors < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :admin, :boolean
  end
end
