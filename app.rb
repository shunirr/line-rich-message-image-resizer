# coding: utf-8

require 'sinatra'
require 'open-uri'
require 'RMagick'
require 'digest/sha1'
require 'uri'

def create_cache_image(origin_uri, size, cache_dir)
  hash = Digest::SHA1.hexdigest "#{origin_uri}/#{size}"
  cache_path = File.join(cache_dir, hash)
  unless File.exists? cache_path
    original_img = Magick::Image.from_blob(open(origin_uri, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read).first
    scale = 1.0 * size / original_img.columns
    scaled_img = original_img.scale scale
    scaled_img.write cache_path
  end

  cache_path
end

get /^\/(.*)\/(\d+)$/ do
  origin_uri, size = params['captures']
  size = size.to_i
  if size >= 2080
    size = 2080
  elsif size < 1
    size = 1
  end
  if origin_uri =~ /^(https?)\//
    origin_uri = URI.parse "#{$1}://#{origin_uri.sub(/^https?\//, '')}"
  else
    origin_uri = URI.parse "http://#{origin_uri}"
  end

  cache_path = create_cache_image origin_uri, size, "cache/"

  new_img = Magick::Image.from_blob(File.open(cache_path).read).first
  content_type "image/#{new_img.format.downcase}"
  new_img.to_blob
end

