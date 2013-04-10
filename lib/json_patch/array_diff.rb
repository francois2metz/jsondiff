module JsonPatch
  class ArrayDiff
    include Helpers

    def self.generate(result, prefix, array1, array2)
      if array1.size < array2.size
        array2.each_with_index do |value, index|
          if array1.at(index) != value
            result << add_op(prefix, index, value)
            array1.insert(index, value)
          end
        end
      elsif array1.size > array2.size
        array1.each_with_index do |value, index|
          if array2.at(index) != value
            result << remove_op(prefix, index)
            array1.delete_at(index)
          end
        end
      end
      array2.each_with_index do |value, index|
        if array1.at(index) != value
          if value.kind_of?(Hash) && array1.at(index).kind_of?(Hash)
            HashDiff.generate(result, "#{prefix}/#{index}", array1.at(index), value)
          elsif value.kind_of?(Array) && array1.at(index).kind_of?(Array)
            ArrayDiff.generate(result, "#{prefix}/#{index}", array1.at(index), value)
          else
            result << replace_op(prefix, index, value)
          end
        end
      end
    end
  end
end
