module ActiveRecord
  module Acts
    module Finder
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def acts_as_finder(*fields)
          instance_eval <<-EOV
            @acts_as_finder_fields ||= []
            @acts_as_finder_fields += #{fields}
            def method_missing(sym, *args, &block)
              begin 
                super
              rescue => e
                @acts_as_finder_fields.each do |field|
                  el = where(field.to_sym => sym).first
                  return el if el
                end
                raise e
              end
            end
            
            def methods
              @acts_as_finder_fields.inject(super) do |acc, field|
                acc += all.map { |r| r.send(field).to_sym }
              end
            end
          EOV
        end
      end

    end
  end
end