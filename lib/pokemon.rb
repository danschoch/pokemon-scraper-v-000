class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (id:, name:, type:, db:)
    @id = :id
    @name = :name
    @type = :type
    @db = :db
  end

  def save (name, type, db_connect)
    db_connect.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)

  end
end
