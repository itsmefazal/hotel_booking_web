module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :location, type: 'text'
    end

    def self.search(query)
      params = {
        query: {
          multi_match: {
            query: query,
            fields: ['location'],
            fuzziness: "AUTO"
          }
        }
      }

      self.import
      self.__elasticsearch__.search(params).records.to_a
    end
  end
end
