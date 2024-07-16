# frozen_string_literal: true

module ComponentWithIcon
  def icon_path(icon:)
    return unless icon.present?

    "icons/solid/#{icon}.svg"
  end
end
