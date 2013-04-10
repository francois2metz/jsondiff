require 'json_patch/helpers'
require 'json_patch/hash_diff'
require 'json_patch/array_diff'

module JsonPatch
  def self.generate(hash1, hash2)
    HashDiff.generate([], "", hash1, hash2)
  end
end
