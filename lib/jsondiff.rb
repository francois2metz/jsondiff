require 'jsondiff/helpers'
require 'jsondiff/hash_diff'
require 'jsondiff/array_diff'

module JsonDiff
  include Helpers
  
  PRIMATIVES = [String,Array,Hash,NilClass,TrueClass,FalseClass,Integer,Float,Fixnum]

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
    elsif not PRIMATIVES.include?(arg2.class) and arg2.respond_to?(:as_json) and arg2.as_json.class != arg2.class
      self.generate(arg1.as_json, arg2.as_json, result, prefix)
    else
      result << replace_op(prefix, arg2)
    end
    result
  end
end
