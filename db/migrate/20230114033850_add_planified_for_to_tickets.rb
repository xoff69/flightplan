class AddPlanifiedForToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :planified_for, :timestamp
  end
end
