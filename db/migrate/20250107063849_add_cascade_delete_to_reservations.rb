class AddCascadeDeleteToReservations < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :reservations, :rooms
    add_foreign_key :reservations, :rooms, on_delete: :cascade
  end
end
