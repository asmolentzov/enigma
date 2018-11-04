require './lib/shift'
require './lib/codebook'

class Enigma
  
  def encrypt(message, key = nil, date = Date.today)
    if key && key.length > 5
      date = key
      key = nil
    end
    
    shift = Shift.new(key, date)
    cipher = Codebook.encrypt(message.downcase, shift)
    {encryption: cipher, key: shift.key, date: shift.date}
  end
  
  def decrypt(cipher, key, date = Date.today)
    shift = Shift.new(key, date)
    message = Codebook.decrypt(cipher.downcase, shift)
    {decryption: message, key: key, date: shift.date}
  end
  
end