class BillFolder

  def self.all_bills
    Bill.all
  end

  def self.find_by_id(id)
    Bill.find(id)
  end

  def self.add_bill(bill)
    bill.save
  end

  def self.remove_bill(bill)
    bill.destroy
  end

end