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

  def patients
    self.appointments.collect{|app| app.doctor}.uniq
  end

  def new_appointment(name, patient)
    Appointment.new(name, patient, self)
  end

end
