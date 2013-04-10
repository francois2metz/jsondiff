module JsonPatch
  class HashDiff
    include Helpers

    def self.generate(result, prefix, hash1, hash2)
      hash2.each do |key, value|
        if !hash1.has_key? key
          result << add_op(prefix, key, value)
        else
          value2 = hash1.fetch(key)
          if value != value2
            if value.kind_of?(Array) && value2.kind_of?(Array)
              ArrayDiff.generate(result, "#{prefix}/#{key}", value2, value)
            elsif value.kind_of?(Hash) && value2.kind_of?(Hash)
              HashDiff.generate(result, "#{prefix}/#{key}", value2, value)
            else
              result << replace_op(prefix, key, value)
            end
          end
        end
      end
      hash1.each do |key, value|
        unless hash2.has_key? key
          result << remove_op(prefix, key)
        end
      end
      result
    end
  end
end
