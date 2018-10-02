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

  def self.find (id_num, db_connect)
    pk_id = db_connect.execute("SELECT id FROM pokemon WHERE id = ?", id_num)
    pk_name = db_connect.execute("SELECT name FROM pokemon WHERE id = ?", id_num)
    pk_type = db_connect.execute("SELECT type FROM pokemon WHERE id = ?", id_num)

    self.new(id: pk_id[0], name: pk_name, type: pk_type, db: db_connect)
  end
end
