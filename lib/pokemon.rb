class Pokemon
  attr_accessor :id, :name, :type, ::key => "value",  :db

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
    pk_name = db_connect.execute("SELECT name FROM pokemon WHERE id = ?", id_num).flatten
    pk_type = db_connect.execute("SELECT type FROM pokemon WHERE id = ?", id_num).flatten

    self.new(id: id_num, name: pk_name[0], type: pk_type[0], db: db_connect)
  end
end
