# encoding: utf-8
class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
      valid = begin
        uri = URI.parse(value)
        uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
      rescue URI::InvalidURIError
        false
      end

      record.errors[attribute] << "não é válido" unless valid
    end
end