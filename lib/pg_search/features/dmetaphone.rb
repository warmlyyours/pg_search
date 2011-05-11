require "active_support/core_ext/module/delegation"

module PgSearch
  module Features
    class DMetaphone < PgSearch::Features::Feature
      delegate :conditions, :rank, :to => :'@tsearch'

      def initialize(*)
        super
        @options[:dictionary] = :simple
        @tsearch = TSearch.new(@query, @options, @columns, @model, Normalizer.new(@normalizer))
      end

      # Decorates a normalizer with dmetaphone processing.
      class Normalizer
        def initialize(normalizer_to_wrap)
          @decorated_normalizer = normalizer_to_wrap
        end

        def add_normalization(original_sql)
          otherwise_normalized_sql = @decorated_normalizer.add_normalization(original_sql)
          "pg_search_dmetaphone(#{otherwise_normalized_sql})"
        end
      end
    end
  end
end
