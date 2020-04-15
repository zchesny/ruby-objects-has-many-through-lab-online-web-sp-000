class Patient

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select{|app| app.patient == self}
  end

  def doctors
    self.appointments.collect{|app| app.doctor}.uniq
  end

  def new_appointment(name, doctor)
    Appointment.new(name, self, doctor)
  end

end
