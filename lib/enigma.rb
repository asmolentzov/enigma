require './lib/shift'
require './lib/codebook'

class Enigma
  
  CHARACTER_SET = ("a".."z").to_a << " "
  KEY_LENGTH = 5
  NUMBER_SHIFTS = 4
  CRACK_PHRASE = ' end'
  
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
    crack = Crack.crack(cipher, date)
    {decryption: crack.message, key: crack.key, date: crack.date}
  end
end