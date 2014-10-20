require 'connection_adapter'
module ActiveRecord
  class Base
    @@connection = SqliteAdapter.new

    def initialize(attributes)
      @attributes = attributes
    end

    def method_missing(name)
      columns = @@connection.columns(self.class.table_name)
      if columns.include? name
        @attributes[name]
      else
        super
      end
    end

    def self.find(id)
      find_by_sql("select * from #{self.table_name} where id=#{id} LIMIT 1").first
    end

    def self.find_by_sql(sql)
      rows = @@connection.execute(sql)

      rows.map do |attributes|
        new attributes
      end
    end

    def self.table_name
      name.downcase + "s"
    end

    def self.all
      find_by_sql("select * from #{self.table_name}")
    end

  end
end
