module StackMaster::TemplateCompilers
  class Yaml

    def self.compile(template_file_path)
      template_body = File.read(template_file_path)
      JSON.dump(YAML.load(template_body))
    end

    StackMaster::TemplateCompiler.register(:yaml, self)
    StackMaster::TemplateCompiler.register(:yml, self)
  end
end