module PgSearch
  module Features
    class Feature
      def initialize(query, options, columns, model, normalizer)
        @query = query
        @options = options || {}
        @model = model
        @columns = columns
        @normalizer = normalizer
      end
    end
  end
end
