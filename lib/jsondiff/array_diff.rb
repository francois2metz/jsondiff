module JsonDiff
  class ArrayDiff
    include Helpers

    def self.generate(result, prefix, array1, array2)
      if array1.size < array2.size
        array2[(array1.size..array2.size)].each_with_index do |value, index|
          index += array1.size
          if array1[index] != value
            result << add_op(prefix, index, value)
          end
        end
      elsif array1.size > array2.size
        array1[(array2.size..array1.size)].reverse.each_with_index do |value, index|
          index = array1.size - 1 - index
          if array2[index] != value
            result << remove_op(prefix, index)
          end
        end
      end
      array2.each_with_index do |value, index|
        if array1.size > index && array1[index] != value
          JsonDiff.generate(array1[index], value, result, "#{prefix}/#{index}")
        end
      end
    end
  end
end
