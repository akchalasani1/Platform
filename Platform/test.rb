	require 'spreadsheet'

	book = Spreadsheet::Workbook.new
	sheet1 = book.create_worksheet :name => 'Circle_Details'

	urls = %w[
			"https://tlc-testnet.wetrust.io/roscas/pending/5af3969d6a0097000a09ee77?created=1",
			"https://tlc-testnet.wetrust.io/roscas/pending/5af3969d6a0097000a09ee88?created=1",
			"https://tlc-testnet.wetrust.io/roscas/pending/5af3969d6a0097000a09ee99?created=1"
	]

	codes = []

	for url in urls do
		test = url.to_s.split('/')
		#puts test.last
		code = test.last.split('?')
		uniq_id = code.first
		codes.push(uniq_id)

		puts"Code: #{uniq_id}"
		puts "codes: #{codes}"
	end


 j=0

	for i in (0..100)
		# puts "TEst current line is empty: #{sheet1.row(i).nil?}"
		# puts "Value of i: #{i}"
		# puts "#{sheet1.row(i)}"
		if (sheet1.row(i) == [] && j < codes.length)
			sheet1.row(i).push "#{codes[j]}"
			j+=1
			book.write 'Zrcl_test.xls'
		end
			i+=1
	end
