require './lib/shift'
require './lib/encryptor'

class Enigma
  
  def encrypt(message, key = nil, date = Date.today)
    if key && key.length > 5
      date = key
      key = nil
    end
    
    shift = Shift.new(key, date)
    shifts = shift.get_shifts
    encryptor = Encryptor.new(message, shifts)
    cipher = encryptor.encrypt
    {encryption: cipher, key: shift.key, date: shift.date}
  end
  
end