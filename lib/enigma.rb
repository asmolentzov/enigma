require './lib/shift'
require './lib/encryptor'
require './lib/decryptor'

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
  
  def decrypt(cipher, key, date = Date.today)
    shift = Shift.new(key, date)
    decryptor = Decryptor.new(cipher, shift.get_shifts)
    message = decryptor.decrypt
    {decryption: message, key: key, date: shift.date}
  end
  
end