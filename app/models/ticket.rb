class Ticket < ApplicationRecord
  validates_presence_of :table_name
  validates_presence_of :table_key
  belongs_to :user

  enum priority: { high:3 , medium: 2, low: 1 }

  def self.all_active_tickets
    where(active:true)
  end

  def self.tickets_by_resource(resource_id)
    where(table_key: resource_id)
    .where(table_name: "Resources")
  end

  def self.tickets_by_part(part_id)
    where(table_key: part_id)
    .where(table_name: "Parts")
  end

  def self.search(table, active)
    where("table_name = '#{table}' ")
    .where(active: active)
    # key = Ticket.where(table_key: id)
    # result = (table.to_sql + '  UNION  ' + key.to_sql)

    # results = ActiveRecord::Base.connection.execute("SELECT * FROM Tickets WHERE table_name = '#{table}' UNION SELECT * FROM tickets WHERE table_key = #{id};")
  end

end
