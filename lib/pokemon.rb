class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (id:, name:, type:, db:)
    @id = :id
    @name = :name
    @type = :type
    @db = :db
  end

  def self.save (name, type, db_connect)
    db_connect.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find (id, db_connect)
    db_connect.execute("SELECT * FROM pokemon WHERE id = '?'",name, type)
  end
end
