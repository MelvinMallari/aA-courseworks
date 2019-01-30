require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    # ...
    return @cols if @cols
    cols = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    @cols = cols[0].map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |name|
      define_method(name) do 
        self.attributes[name]
      end

      define_method("#{name}=") do |val|
        self.attributes[name] = val
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name || self.to_s.underscore.pluralize
  end

  def self.all
    # ...
    all = DBConnection.instance.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL
    self.parse_all(all)
  end

  def self.parse_all(results)
    results.map {|el| self.new(el)}
  end

  def self.find(id)
    # ...
    res = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
    SQL
    parse_all(res).first
  end

  def initialize(params = {})
    # ...
    params.each do |attr_name, val|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", val)
      else
        raise "unknown attribute '#{attr_name}'" 
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
    @attributes.map { |_, val| val}
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
