class AddIsTimedTicketToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :is_timed_ticket, :boolean
  end
end
