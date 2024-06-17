module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filterable_by(*columns)
      columns.each do |column|
        scope column, -> (query) { where(column => /#{query}/i) }
      end
    end

    def filters(params)
      @records = self

      return @records unless params.present?

      apply_filters(params)

      @records
    end

    private
      def apply_filters(attributes)
        attributes.each do |key, value|
          @records = @records.public_send(key, value) if has_scope?(key, value)
        end
      end

      def has_scope?(key, value)
        self.respond_to?(key) and value.present?
      end
  end
end
