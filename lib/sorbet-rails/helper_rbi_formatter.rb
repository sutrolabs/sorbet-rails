# typed: true

class HelperRbiFormatter
  # @param [Array<String>] helpers
  # @return [void]
  def initialize(helpers)
    @helpers = helpers
  end

  # Generates RBI file's contents.
  # @return [String]
  def generate_rbi
    puts "-- Generate sigs for helpers --"

    rbi = <<~RBI
      # This is an autogenerated file for Rails helpers.
      # Please rerun rake rails_rbi:helpers to regenerate.
      # typed: strong
      
    RBI

    @helpers.each do |helper|
      rbi += <<~RBI
        module #{helper}
          include Kernel
          include ActionView::Helpers
        end

      RBI
    end

    return rbi
  end
end
