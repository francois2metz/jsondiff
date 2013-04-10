require 'json_patch/helpers'
require 'json_patch/hash_diff'
require 'json_patch/array_diff'

module JsonPatch
  # Generate a patch from two ruby hash
  #
  # hash1 - the first hash
  # hash2 - the second hash
  #
  # Returns an array of operations
  def self.generate(hash1, hash2)
    HashDiff.generate([], "", hash1, hash2)
  end
end
