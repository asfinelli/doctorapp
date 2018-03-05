class RemoveAppointmentFollowupFromAppointments < ActiveRecord::Migration[5.1]
  def change
    remove_column :appointments, :appointment_followup, :string
  end
end
