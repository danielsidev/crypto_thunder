# frozen_string_literal: true

require 'crypto_thunder/version'

module CryptoThunder
  # Class for encrypt and decrypt
  class CryptoThunder
    def encrypt(text)
      text = text.to_s unless text.is_a? String
      len = ActiveSupport::MessageEncryptor.key_len
      salt = SecureRandom.hex len
      key = ActiveSupport::KeyGenerator.new('wxzUZkFnaewB1vXIeCpRv8Zlp4K6WlFX').generate_key salt, len
      crypt = ActiveSupport::MessageEncryptor.new key
      encrypted_data = crypt.encrypt_and_sign text
      "#{salt}$$#{encrypted_data}"
    end

    def decrypt(text)
      salt, data = text.split '$$'
      len = ActiveSupport::MessageEncryptor.key_len
      key = ActiveSupport::KeyGenerator.new('wxzUZkFnaewB1vXIeCpRv8Zlp4K6WlFX').generate_key salt, len
      crypt = ActiveSupport::MessageEncryptor.new key
      crypt.decrypt_and_verify data
    end
  end
end
