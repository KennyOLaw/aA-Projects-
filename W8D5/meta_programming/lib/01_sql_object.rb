require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    @columns = DBConnection.execute2(<<-SQL)
              SELECT
                *
              FROM
                #{self.table_name} 
              SQL
    @columns = @columns.first.map(&:to_sym)
  end

  def self.finalize!
    #iterate through the columns
    self.columns.each do |name|
      define_method(name) do 
       self.attributes[name]
      end

      define_method("#{name}=") do |value|
        # self.instance_variable_set("@#{col}", value)
        self.attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end
# Cat.table_name => cats
  def self.table_name
    # ...
    @table_name ||= "#{self}s".downcase
  end

  def self.all
    # ...
    results = DBConnection.execute(<<-SQL)
              SELECT
                *
              FROM
                #{table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    # ...
    arr = []
      results.each do |result|
        arr << self.new(result)
      end
    arr
  end

  def self.find(id)
    # ...
    # self.all.any?{|obj| obj.id == id}

    found = DBConnection.execute(<<-SQL, id)
            SELECT 
              #{table_name}.*
            FROM
              #{table_name}
            WHERE 
              #{table_name}.id = ?
    SQL
      self.parse_all(found)[0]
  end
  # finalize! 
  def initialize(params = {})
    # ... 
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end 
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    @attributes.values
  end

  def insert
    # ...
    cols = (self.class.columns)[1..-1]
    col_names = cols.join(",")
    self.attribute_values
    question_marks = (['?'] * cols.length).join(",")
    DBConnection.execute(<<-SQL, *self.attribute_values)
    INSERT INTO
      #{self.class.table_name}
      (#{col_names})
    VALUES
      (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id 
  end

  def update
    # ...
    
      columns = self.class.columns.drop(1)

      new_column = columns.map {|col| "#{col} = ?"}.join(",") 
     values = self.attribute_values.drop(1)
     DBConnection.execute(<<-SQL, *values, self.id)
      UPDATE                         
        #{self.class.table_name}
      SET
        #{new_column}
      WHERE
      id = ?
    SQL
  end

  def save
    # ...
    if self.id 
      self.update 
    else
      self.insert
    end
  end
end
