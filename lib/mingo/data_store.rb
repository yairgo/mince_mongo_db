module Mince
  module Mingo
    require 'singleton'
    require_relative 'connection'

    class DataStore
      include Singleton

      def self.collection(collection_name)
        instance.collection(collection_name)
      end

      def self.db
        instance.db
      end

      def collection(collection_name)
        db.collection(collection_name)
      end

      attr_reader :db

      def initialize
        @db = Mince::Mingo::Connection.db
      end
    end
  end
end
