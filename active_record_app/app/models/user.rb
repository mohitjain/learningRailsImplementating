require 'connection_adapter'

class User
  @@connection = SqliteAdapter.new

  def initialize(attributes)
    @attributes = attributes
  end

  def id
    @attributes[:id]
  end

  def name
    @attributes[:name]
  end


  def self.find(id)
    find_by_sql("select * from users where id=#{id} LIMIT 1").first
  end

  def self.find_by_sql(sql)
    rows = @@connection.execute(sql)

    rows.map do |attributes|
      new attributes
    end
  end
end
