module YamlBuddy
  def take_yaml(yaml)
    @data = YAML.load(yaml)
    self
  end

  def to_yaml
    @data.to_yaml
  end
 end