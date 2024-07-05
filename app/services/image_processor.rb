# frozen_string_literal: true

# app/services/image_processor.rb
require 'image_processing/mini_magick'
require 'down'

class ImageProcessor
  def self.process(url, width: 100, height: 100)
    downloaded_image = Down.download(url)
    ImageProcessing::MiniMagick
      .source(downloaded_image)
      .resize_to_limit(width, height)
      .call
  end
end
