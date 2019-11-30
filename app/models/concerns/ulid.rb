require 'active_support'
require 'securerandom'

module Ulid
  ENCODING = '0123456789ABCDEFGHJKMNPQRSTVWXYZ'.freeze
  RANDOM_BYTES = 10.freeze
  ENCODED_LENGTH = 26.freeze
  BIT_LENGTH = 128.freeze
  BITS_PER_B32_CHAR = 5.freeze
  MASK = 0x1f.freeze

  class << self
    def generate(time = Time.current)
      generated_bytes = octo_word(time)
      encode(generated_bytes, ENCODED_LENGTH)
    end

    private

    def encode(n, length)
      e, i = '0' * length, length - 1
      loop do
        break unless n > 0
        e[i] = ENCODING[n & MASK]
        n >>= 5
        i -= 1
      end
      e
    end

    def octo_word(time = Time.now)
      (hi, lo) = generate_bytes(time).unpack('Q>Q>')
      (hi << 64) | lo
    end

    def time_to_48bit(time = Time.now)
      time_ms = (time.to_f * 1000).to_i
      [time_ms].pack('Q>')[2..-1]
    end

    def random_bytes
      SecureRandom.random_bytes(RANDOM_BYTES)
    end

    def generate_bytes(time = Time.now)
      time_to_48bit(time) + random_bytes
    end
  end
end
