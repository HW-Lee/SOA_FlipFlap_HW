require_relative './tsv_buddy'
requite_relative './yaml_buddy'

class FlipFlap
  # Do NOT create an initialize method
  include TsvBuddy
  include YamlBuddy
end
