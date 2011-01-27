class Convert < Tableless

	TIME_ZONES = ActiveSupport::TimeZone.all.sort { |x,y| x.name <=> y.name }.inject({}) { |b, x| b[x.tzinfo.name.match(/\w+/)[0]] = [] unless b[x.tzinfo.name.match(/\w+/)[0]]; b[x.tzinfo.name.match(/\w+/)[0]] << [ x.name, "#{x.tzinfo.name}:#{x.name}" ]; b }.to_a

	column :epoch, :string
	column :timezone, :string
	column :datetime, :string

  validates_presence_of :timezone, :message => 'Timezone field cannot be blank'
  validates_presence_of :datetime, :message => 'Date/time field cannot be blank'

  def chronic_date

		datetime = self.datetime.dup

		begin

			as_epoch = false

			if self.datetime.gsub!(/ as epoch/, '')
				as_epoch = true
			end

			t = Chronic.parse(self.datetime, { :now => TZInfo::Timezone.get(self.timezone).now })

			if as_epoch
				t = t.to_i
			else
				t = t.strftime('%d/%m/%Y %I:%M:%S %p')
			end

		rescue Exception
		end

		self.datetime = datetime

		return t

  end

	def validate
		errors.add :datetime, "Chronic could not understand you sorry." unless self.chronic_date
	end
  
end
