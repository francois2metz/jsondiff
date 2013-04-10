module JsonPatch
  module Helpers
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def add_op(prefix, key, value)
        {op: :add, path: "#{prefix}/#{key}", value: value}
      end

      def remove_op(prefix, key)
        {op: :remove, path: "#{prefix}/#{key}"}
      end

      def replace_op(prefix, key, value)
        {op: :replace, path: "#{prefix}/#{key}", value: value}
      end
    end
  end
end
