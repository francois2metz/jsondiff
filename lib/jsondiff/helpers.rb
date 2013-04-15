module JsonDiff
  module Helpers
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def add_op(path, value)
        {op: :add, path: path.join('/'), value: value}
      end

      def remove_op(path)
        {op: :remove, path: path.join('/')}
      end

      def replace_op(path, value)
        {op: :replace, path: path.join('/'), value: value}
      end
    end
  end
end
