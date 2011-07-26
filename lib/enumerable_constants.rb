# This module can be used for situations where enumerating over constant values is desired.
# This facilitates keeping the code DRY by keeping the constant values defined in one place, and
# still having the ability to enumerate over their values wherever they are needed.
#
# ## Example use cases
#
# * defining constants for possible field values in an AR object while using the values in a
#   `validates_inclusion_of` validation
# * defining constants for select box values in a view helper and using this module to allow them to be
#   enumerated over in the select tag
#
module EnumerableConstants

  def EnumerableConstants.included(mod)
    class << mod
      include Enumerable

      def enumerable(*consts)
        @enumerable_consts = consts unless consts.empty?
      end

      # Yields each constant value to &block.  By default, all constants defined by the
      # including class are yielded.  If specific constants are to be yielded, call 
      # EnumerableConstants#enumerable(*consts) before calling this method.

      def each(&block)
        consts = @enumerable_consts || self.constants.grep(/[^a-z][A-Z_]+/)
        consts.each do |const|
          yield self.const_get(const)
        end
      end

      # #each_constant is provided as syntactic sugar for situations where it may be more appropriate than #each
      alias_method :each_constant, :each
    end
  end
end
