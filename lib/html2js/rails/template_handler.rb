require 'tilt'
require 'sprockets'

module Html2js
  class TemplateHandler < Tilt::Template
    def self.default_mime_type
      'application/javascript'
    end

    def self.engine_initialized?
      true
    end

    def initialize_engine
    end

    def prepare *args
    end

    def root_path
      @@root_path ||= if Html2js.configuration.root =~ /\/$/
        Html2js.configuration.root
      else
        "#{Html2js.configuration.root}/"
      end
    end

    def evaluate(scope, locals, &block)
      filename = file.gsub(root_path, '').gsub(/\.js/, '').gsub(/\.haml/, '.html')
      <<EOT
try {
  requirements = angular.module('templates').requires;
} catch (e) {
  requirements = [];
}
requirements.push("#{filename}");
angular.module('templates', requirements);
angular.module("#{filename}", []).run(["$templateCache", function($templateCache) {
  $templateCache.put("#{filename}",
    "#{data.gsub(/"/, "\\\"").gsub(/\r?\n/, "\\n\" +\n    \"")}"
  );
}]);
EOT
    end
  end
end

Sprockets.register_engine '.haml', Tilt::HamlTemplate
Sprockets.register_engine '.tpl', Html2js::TemplateHandler