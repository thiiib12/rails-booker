class AddConfirmedToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :confirmed?, :boolean, default: false
  end
end
