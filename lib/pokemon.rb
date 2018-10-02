class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save (name, type, db_connect)
    db_connect.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find (id_num, db_connect)
    #pk_id = db_connect.execute("SELECT id FROM pokemon WHERE id = ?", id_num)
    pk_name = db_connect.execute("SELECT name FROM pokemon WHERE id = ?", id_num)
    pk_type = db_connect.execute("SELECT type FROM pokemon WHERE id = ?", id_num)

    #pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    #Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)

    #binding.pry

    self.new(id: id_num, name: pk_name[0], type: pk_type[0], db: db_connect)
  end
end
