module ROM

  # Repository exposes native database connection and schema when it's
  # supported by the adapter
  #
  # @api public
  class Repository
    include Concord::Public.new(:adapter)

    # Return the dataset identified by name
    #
    # @param [String,Symbol] name
    #
    # @api public
    def [](name)
      adapter[name]
    end

    # Return the database connection provided by the adapter
    #
    # @api public
    def connection
      adapter.connection
    end

    # Return the schema provided by the adapter
    #
    # @api private
    def schema
      adapter.schema
    end

    # @api private
    def respond_to_missing?(name, include_private = false)
      adapter[name]
    end

    private

    # @api private
    def method_missing(name)
      adapter[name]
    end
  end

end
