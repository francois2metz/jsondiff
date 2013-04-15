module JsonDiff
  class HashDiff
    include Helpers

    def self.generate(result, path, hash1, hash2)
      hash2.each do |key, value|
        if !hash1.has_key? key
          result << add_op(path.dup << key, value)
        else
          value2 = hash1.fetch(key)
          if value != value2
            JsonDiff.generate(value2, value, result, path.dup << key)
          end
        end
      end
      hash1.each do |key, value|
        unless hash2.has_key? key
          result << remove_op(path.dup << key)
        end
      end
      result
    end
  end
end
