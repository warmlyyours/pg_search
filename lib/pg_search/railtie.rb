module PgSearch
  class Railtie < Rails::Railtie
    generators do
      require "pg_search/generators/dmetaphone_migration/dmetaphone_migration_generator"
    end

    rake_tasks do
      load "pg_search/tasks.rb"
    end
  end
end
