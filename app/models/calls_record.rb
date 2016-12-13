class CallsRecord

  def self.all
    Call.all
  end

  def self.between(since, till)
    Call.where(when_was: since..till)
  end

  def self.find(id)
    Call.find(id)
  end

  def self.add_call(call)
    call.save
  end

end