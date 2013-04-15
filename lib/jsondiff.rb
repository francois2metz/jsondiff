require 'jsondiff/helpers'
require 'jsondiff/hash_diff'
require 'jsondiff/array_diff'

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
