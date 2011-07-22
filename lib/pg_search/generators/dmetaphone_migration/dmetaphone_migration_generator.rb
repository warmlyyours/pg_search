module PgSearch
  module Generators
    class DmetaphoneMigrationGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Create a migration that adds a pg_search_dmetaphone() database function"

      def create_migration
        now = Time.now.utc
        filename = "db/migrate/#{now.strftime('%Y%m%d%H%M%S')}_create_pg_search_dmetaphone_function.rb"
        template("create_pg_search_dmetaphone_function.rb", filename)
      end

      private

      def up_sql
        File.read(File.join(File.dirname(__FILE__), *%w[.. .. .. .. sql dmetaphone.sql])).chomp
      end

      def down_sql
        File.read(File.join(File.dirname(__FILE__), *%w[.. .. .. .. sql uninstall_dmetaphone.sql])).chomp
      end
    end
  end
end

