module JsonPatch
  def self.generate(hash1, hash2)
    hash_diff("", hash1, hash2)
  end

  def self.hash_diff(prefix, hash1, hash2)
    result = []
    hash2.each do |key, value|
      if !hash1.has_key? key
        result << {op: :add, path: "#{prefix}/#{key}", value: value}
      elsif value != hash1.fetch(key)
        if value.kind_of?(Array) &&  hash1.fetch(key).kind_of?(Array)
          result = result + array_diff("#{prefix}/#{key}", hash1.fetch(key), value)
        elsif value.kind_of?(Hash) && hash1.fetch(key).kind_of?(Hash)
          result = result + hash_diff("#{prefix}/#{key}", hash1.fetch(key), value)
        else
          result << {op: :replace, path: "#{prefix}/#{key}", value: value}
        end
      end
    end
    hash1.each do |key, value|
      unless hash2.has_key? key
        result << {op: :remove, path: "#{prefix}/#{key}"}
      end
    end
    result
  end

  def self.array_diff(prefix, array1, array2)
    result = []
    if array1.size < array2.size
      array2.each_with_index do |value, index|
        if array1.at(index) != value
          result << {op: :add, path: "#{prefix}/#{index}", value: value}
          array1.insert(index, value)
        end
      end
    elsif array1.size > array2.size
      array1.each_with_index do |value, index|
        if array2.at(index) != value
          result << {op: :remove, path: "#{prefix}/#{index}"}
          array1.delete_at(index)
        end
      end
    end
    array2.each_with_index do |value, index|
      if array1.at(index) != value
        result << {op: :replace, path: "#{prefix}/#{index}", value: value}
      end
    end
    result
  end
end
