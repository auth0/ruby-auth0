# frozen_string_literal: true

module Auth0
  module Types
    # Page Background Color or Gradient.
    # Property contains either <code>null</code> to unset, a solid color as a string value <code>#FFFFFF</code>, or a
    # gradient as an object.
    #
    # <pre><code>
    # {
    #   type: 'linear-gradient',
    #   start: '#FFFFFF',
    #   end: '#000000',
    #   angle_deg: 35
    # }
    # </code></pre>
    class BrandingPageBackground < Internal::Types::Model
      extend Auth0::Internal::Types::Union

      member -> { String }
      member -> { Internal::Types::Hash[String, Object] }
    end
  end
end
