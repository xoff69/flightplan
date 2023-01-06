class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :label
      t.string :description
      t.string :color
      t.boolean :archived
      t.timestamp :datearchived
      t.timestamp :duedate

      t.timestamps
    end
  end
end
