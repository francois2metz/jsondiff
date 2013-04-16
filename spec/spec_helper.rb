require_relative '../lib/jsondiff'
require 'json'
require_relative  './hana/lib/hana'

RSpec.configure do |c|
  c.filter_run focus: true
  c.run_all_when_everything_filtered = true
end
