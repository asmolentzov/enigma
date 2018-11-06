require './lib/shift'
require './lib/codebook'

class Enigma
  
  CHARACTER_SET = ("a".."z").to_a << " "
  KEY_LENGTH = 5
  NUMBER_SHIFTS = 4
  CRACK_PHRASE = [' ', 'e', 'n', 'd']
  
  def encrypt(message, key = nil, date = Date.today)
    if key && key.length > KEY_LENGTH
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
  
  def crack(cipher, date = Date.today)
    message = ''
    until message[-4, 4] == ' end'
      key = Key.new(nil).key
      message = decrypt(cipher, key, date)[:decryption]
    end
    {decryption: message, key: key, date: date}
  end
end