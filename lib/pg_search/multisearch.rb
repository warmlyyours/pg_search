module PgSearch
  module Multisearch
    autoload :Rebuilder, "pg_search/multisearch/rebuilder"

    class << self
      def rebuild(model_class, clean_up = true)
        rebuilder = Rebuilder.new(model_class)

        if clean_up
          model_class.transaction do
            debugger
            PgSearch::Document.where(:searchable_type => model_class).delete_all
            rebuilder.rebuild
          end
        else
          rebuilder.rebuild
        end
      end
    end

    class ModelNotMultisearchable < StandardError
      def initialize(model_class)
        @model_class = model_class
      end

      def message
        "#{@model_class.name} is not multisearchable. See PgSearch::ClassMethods#multisearchable"
      end
    end
  end
end


