require 'jsondiff/helpers'
require 'jsondiff/hash_diff'
require 'jsondiff/array_diff'

module JsonDiff
  include Helpers

  # Generate a patch from two ruby hash
  #
  # arg1 - the first argument
  # arg2 - the second argument
  #
  # Returns an array of operations
  def self.generate(arg1, arg2, result=[], prefix="")
    if Hash === arg1 && Hash === arg2
      HashDiff.generate(result, prefix, arg1, arg2)
    elsif Array === arg1 && Array === arg2
      ArrayDiff.generate(result, prefix, arg1, arg2)
    else
      result << replace_op(prefix, arg2)
    end
    result
  end
end
