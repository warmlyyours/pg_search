class CreatePgSearchDMetaphoneFunction < ActiveRecord::Migration
  def self.up
    say_with_time("Adding support functions for pg_search :dmetaphone") do
      ActiveRecord::Base.connection.execute(<<-SQL)
        <%= up_sql %>
      SQL
    end
  end

  def self.down
    say_with_time("Dropping support functions for pg_search :dmetaphone") do
      ActiveRecord::Base.connection.execute(<<-SQL)
        <%= down_sql %>
      SQL
    end
  end
end
