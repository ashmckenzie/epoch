class Convert < Tableless

	TIME_ZONES = ActiveSupport::TimeZone.all.sort { |x,y| x.name <=> y.name }.inject({}) { |b, x| b[x.tzinfo.name.match(/\w+/)[0]] = [] unless b[x.tzinfo.name.match(/\w+/)[0]]; b[x.tzinfo.name.match(/\w+/)[0]] << [ x.name, "#{x.tzinfo.name}:#{x.name}" ]; b }.to_a

	column :epoch, :string
	column :timezone, :string
	column :datetime, :string

  validates_presence_of :timezone, :message => 'Timezone field cannot be blank'
  validates_presence_of :datetime, :message => 'Date/time field cannot be blank'

  def chronic_date
		begin
			Chronic.parse(self.datetime, { :now => TZInfo::Timezone.get(self.timezone).now })
		rescue Exception
		end
  end

	def validate
		errors.add :datetime, "Chronic could not understand you sorry." unless self.chronic_date
	end
  
end
