class Session < ApplicationRecord
    def self.sweep(time = 1.hour)
      if time.is_a?(String)
        time = time.split.inject { |count, unit| count.to_i.send(unit) }
      end
    delete_all "updated_at < '#{1.minute.ago.to_s(:db)}' OR
        created_at < '#{1.minute.ago.to_s(:db)}'"
    end
  end