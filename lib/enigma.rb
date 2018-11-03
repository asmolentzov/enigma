require './lib/shift'
require './lib/encryptor'

class Enigma
  
  def encrypt(message, key = nil, date = Date.today)
    shift = Shift.new(key, date)
    shifts = shift.get_shifts
    encryptor = Encryptor.new(message, shifts)
    cipher = encryptor.encrypt
    {encryption: cipher, key: key, date: date}
  end
  
end