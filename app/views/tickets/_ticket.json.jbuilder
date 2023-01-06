json.extract! ticket, :id, :label, :description, :color, :archived, :datearchived, :duedate, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
