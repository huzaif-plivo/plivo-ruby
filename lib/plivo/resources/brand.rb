module Plivo
  module Resources
    include Plivo::Utils
    class Brand < Base::Resource
      def initialize(client, options = nil)
        @_name = '10dlc/Brand'
        @_identifier_string = 'brand_id'
        super
      end
  
      def to_s
        {
          api_id: @api_id,
          brand: @brand
        }.to_s
      end
    end
  
    class BrandInterface < Base::ResourceInterface
      def initialize(client, resource_list_json = nil)
        @_name = '10dlc/Brand'
        @_resource_type = Brand
        @_identifier_string = 'brand_id'
        super
      end
  
        ##
        # Get an Brand
        # @param [String] brand_id
        # @return [Brand] Brand
      def get(brand_id)
        valid_param?(:brand_id, brand_id, [String, Symbol], true)
        perform_get(brand_id)
      end
  
        ##
        # List all Brand
        # @param [Hash] options
        # @option options [String] :type
        # @option options [Status] :status
        # @return [Hash]
      def list(options=nil)
        return perform_list_without_object if options.nil?
  
        params = {}
        %i[status type].each do |param|
          if options.key?(param) && valid_param?(param, options[param],
                                                   [String], true)
            params[param] = options[param]
          end
        end  
        perform_list_without_object(params)
      end
  
        ##
        # Create a new brand
      def create(params)
        perform_create(params)
      end
    end
  end
end