module ActionView
  module TemplateHandlers
    class Rails3View < TemplateHandler
      include Compilable
      class TemplateDidNotReturnImage < RuntimeError #:nodoc:
      end

      def compile(template)
        <<-CODE
        @template_format = :flexi
        controller.response.content_type ||= Mime::JPG    
        result = #{template.source}
        requested_format = (params[:format] || :jpg).to_sym
        begin
          # Raise an error if object returned from template is not an image record
          unless result.class.include?(Fleximage::Model::InstanceMethods)
            raise TemplateDidNotReturnImage, ".flexi template was expected to return a model instance that acts_as_fleximage, but got an instance of instead."
          end
          # Figure out the proper format
          raise 'Image must be requested with an image type format.  jpg, gif and png only are supported.' unless [:jpg, :gif, :png].include?(requested_format)
          result.output_image(:format => requested_format)
        rescue Exception => e
          e
        end
        CODE
      ensure
        GC.start
      end
    end
  end
end