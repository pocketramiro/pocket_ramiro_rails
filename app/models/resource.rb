class Resource < ApplicationRecord
  validates_presence_of :name

  belongs_to :resource_type
  belongs_to :user
  has_many :resource_parts
  has_many :parts, through: :resource_parts

  def self.all_active_resources
    where(active:true)
  end

  def self.all_with_tickets
    sql = "select *, case when table_key is not null then 1 end as open_ticket from resources left outer join tickets on resources.id = tickets.table_key;"
    results = ActiveRecord::Base.connection.execute(sql)
  end

  def self.high_volume_tickets
    sql = "select resources.name, resources.id, count(table_key)as number_tickets from resources left outer join tickets on resources.id = tickets.table_key group by resources.name, resources.id having count(table_name) >= 2;"
    results = ActiveRecord::Base.connection.execute(sql)
  end

end
