require 'json_diff/helpers'
require 'json_diff/hash_diff'
require 'json_diff/array_diff'

module JsonDiff
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
