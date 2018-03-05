class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :doctor, foreign_key: true
      t.string "name"
      t.string "symptoms"
      t.string "blood_pressure"
      t.string "temperature"
      t.string "medications"
      t.string "appointment_followup"
      t.string "prescription"
      t.string "followup"
      t.string "prescriptions"
      t.text "follow_up"
      t.timestamps
    end
  end
end
