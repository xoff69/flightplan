class AddBoardIdToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :board_id, :integer
  end
end
