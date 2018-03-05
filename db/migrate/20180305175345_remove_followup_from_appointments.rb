class RemoveFollowupFromAppointments < ActiveRecord::Migration[5.1]
  def change
    remove_column :appointments, :followup, :string
  end
end
