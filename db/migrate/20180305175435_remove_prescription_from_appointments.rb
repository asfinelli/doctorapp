class RemovePrescriptionFromAppointments < ActiveRecord::Migration[5.1]
  def change
    remove_column :appointments, :prescription, :string
  end
end
